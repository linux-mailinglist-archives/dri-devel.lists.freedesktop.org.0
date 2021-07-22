Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B80513D2F82
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 00:09:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7115F6E9A7;
	Thu, 22 Jul 2021 22:09:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8736D6E9A7
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 22:09:10 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 68-20020a9d0f4a0000b02904b1f1d7c5f4so214707ott.9
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 15:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=VxPtTyDnbKdFhgXCCn4QqHsoTqz/m8J6bRqsRz2hob4=;
 b=RhsyBT3smW09/d+mV3cAkLf8mUDcgRa98ny9KBq64hFaYy7eBfpEtsyTW2X2U1o7Wu
 jG1ugSygYSUEJHrC+UZ24sEC2pxjv+I9KR06a2FA5rR9jrrby73yrF+C73AjmSh7AFnD
 hDBB7hmgU9yXAWQUV4k3jv+vFOZdZ5yMxWQ7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=VxPtTyDnbKdFhgXCCn4QqHsoTqz/m8J6bRqsRz2hob4=;
 b=Xc69GUya0wxBiMYh7sfXN+FM4mDj95+4t2d/oa6BEZCG0lroAI/Z3r17SfC8JRvGbF
 16P43Enle8gjSs7LvvWdXJ3MVsFfj+brrEn1cT9w7ZDs1j49TwdCinE+6XX/OZZ1omQb
 Ii02VVL2v9LkPc4E2w04TgOAdHe1UwjCW5QFoxgsuW9nRhzz32+QuCCjM+oLy1idTH0f
 WBqsEmCbl0TwYFl8TrpFQwt1bVPXb0E+k81V/qsPP+TdqzluhL8IEEcBFaXJHMf3dnbn
 9BsiSuiEmQv7fqpAUz1CXkpsM1TCZFeJLm9cyFIQwWs1Um4AC4ClVssV325jd38GX/OG
 2S9A==
X-Gm-Message-State: AOAM5311Zq7WWCLjCmRjGsNtxTreSrVdQiiiuRZmeuYEWB1DaaTx9HN1
 DG7JVPxUpW8xeo7yGOezo43I915DYGzgj/GBh4IR0Q==
X-Google-Smtp-Source: ABdhPJwSAou744IO5xsHJaf7ML4r6JmUg3v1Hqcu4+7d/Wc1m7Yo0TQLNIT2sJkRNe9bEISqELAFMOuQ62sNMkX6qNA=
X-Received: by 2002:a9d:8c7:: with SMTP id 65mr1225563otf.25.1626991749618;
 Thu, 22 Jul 2021 15:09:09 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jul 2021 22:09:09 +0000
MIME-Version: 1.0
In-Reply-To: <4a97d331d7a60cb4756899d98f81ca4f@codeaurora.org>
References: <1626909581-2887-1-git-send-email-maitreye@codeaurora.org>
 <CAE-0n50zCC9m9Wr6WUvM=mfaQ7GXVEjHNC_T2RfN1=9Y1U_qsg@mail.gmail.com>
 <4a97d331d7a60cb4756899d98f81ca4f@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 22 Jul 2021 22:09:09 +0000
Message-ID: <CAE-0n522OEz8YwKRb8VZtSbwAdjXReEPCwvL8N7kWycGSrbvxw@mail.gmail.com>
Subject: Re: [PATCH v4] drm/msm/dp: add logs across DP driver for ease of
 debugging
To: maitreye@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-arm-msm@vger.kernel.org, abhinavk@codeaurora.org,
 khsieh@codeaurora.org, seanpaul@chromium.org, dri-devel@lists.freedesktop.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting maitreye@codeaurora.org (2021-07-22 14:33:43)
> Thank you Stephen.
>
> On 2021-07-22 13:31, Stephen Boyd wrote:
> > Quoting maitreye (2021-07-21 16:19:40)
> >> From: Maitreyee Rao <maitreye@codeaurora.org>
> >>
> >> Add trace points across the MSM DP driver to help debug
> >> interop issues.
> >>
> >> Changes in v4:
> >>  - Changed goto statement and used if else-if
> >
> > I think drm likes to see all the changelog here to see patch evolution.
> >
> Yes, I will fix this
> >>
> >> Signed-off-by: Maitreyee Rao <maitreye@codeaurora.org>
> >> ---
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c
> >> b/drivers/gpu/drm/msm/dp/dp_link.c
> >> index be986da..8c98ab7 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> >> @@ -1036,43 +1036,28 @@ int dp_link_process_request(struct dp_link
> >> *dp_link)
> >>
> >>         if (link->request.test_requested == DP_TEST_LINK_EDID_READ) {
> >>                 dp_link->sink_request |= DP_TEST_LINK_EDID_READ;
> >> -               return ret;
> >>         }
> >> -
> >> -       ret = dp_link_process_ds_port_status_change(link);
> >> -       if (!ret) {
> >> +       else if (!(ret = dp_link_process_ds_port_status_change(link)))
> >> {
> >>                 dp_link->sink_request |= DS_PORT_STATUS_CHANGED;
> >> -               return ret;
> >>         }
> >> -
> >> -       ret = dp_link_process_link_training_request(link);
> >> -       if (!ret) {
> >> +       else if (!(ret = dp_link_process_link_training_request(link)))
> >> {
> >>                 dp_link->sink_request |= DP_TEST_LINK_TRAINING;
> >> -               return ret;
> >>         }
> >> -
> >> -       ret = dp_link_process_phy_test_pattern_request(link);
> >> -       if (!ret) {
> >> +       else if (!(ret =
> >> dp_link_process_phy_test_pattern_request(link))) {
> >>                 dp_link->sink_request |=
> >> DP_TEST_LINK_PHY_TEST_PATTERN;
> >> -               return ret;
> >> -       }
> >> -
> >> -       ret = dp_link_process_link_status_update(link);
> >> -       if (!ret) {
> >> +       }
> >> +       else if (!(ret = dp_link_process_link_status_update(link))) {
> >
> > The kernel coding style is to leave the brackets on the same line
> >
> >       if (condition) {
> >
> >       } else if (conditon) {
> >
> >       }
> >
> > See Documentation/process/coding-style.rst
> >
> Yes, I will fix this
>
> > Also, the if (!(ret = dp_link_...)) style is really hard to read. Maybe
> > apply this patch before?
> >
> > ----8<----
> > diff --git a/drivers/gpu/drm/msm/dp/dp_link.c
> > b/drivers/gpu/drm/msm/dp/dp_link.c
> > index 1195044a7a3b..408cddd90f0f 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_link.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> > @@ -1027,41 +1027,22 @@ int dp_link_process_request(struct dp_link
> > *dp_link)
> >
> >       if (link->request.test_requested == DP_TEST_LINK_EDID_READ) {
> >               dp_link->sink_request |= DP_TEST_LINK_EDID_READ;
> > -             return ret;
> > -     }
> > -
> > -     ret = dp_link_process_ds_port_status_change(link);
> > -     if (!ret) {
> > +     } else if (!dp_link_process_ds_port_status_change(link)) {
> >               dp_link->sink_request |= DS_PORT_STATUS_CHANGED;
> > -             return ret;
> > -     }
> > -
> > -     ret = dp_link_process_link_training_request(link);
> > -     if (!ret) {
> > +     } else if (!dp_link_process_link_training_request(link)) {
> >               dp_link->sink_request |= DP_TEST_LINK_TRAINING;
> > -             return ret;
> > -     }
> > -
> > -     ret = dp_link_process_phy_test_pattern_request(link);
> > -     if (!ret) {
> > +     } else if (!dp_link_process_phy_test_pattern_request(link)) {
> >               dp_link->sink_request |= DP_TEST_LINK_PHY_TEST_PATTERN;
> > -             return ret;
> > -     }
> > -
> > -     ret = dp_link_process_link_status_update(link);
> > -     if (!ret) {
> > +     } else if (!dp_link_process_link_status_update(link)) {
> >               dp_link->sink_request |= DP_LINK_STATUS_UPDATED;
> > -             return ret;
> > -     }
> > -
> > -     if (dp_link_is_video_pattern_requested(link)) {
> > -             ret = 0;
> > -             dp_link->sink_request |= DP_TEST_LINK_VIDEO_PATTERN;
> > -     }
> > +     } else {
> > +             if (dp_link_is_video_pattern_requested(link))
> > +                     dp_link->sink_request |= DP_TEST_LINK_VIDEO_PATTERN;
> >
> > -     if (dp_link_is_audio_pattern_requested(link)) {
> > -             dp_link->sink_request |= DP_TEST_LINK_AUDIO_PATTERN;
> > -             return -EINVAL;
> > +             if (dp_link_is_audio_pattern_requested(link)) {
> > +                     dp_link->sink_request |= DP_TEST_LINK_AUDIO_PATTERN;
> > +                     ret = -EINVAL;
> > +             }
> >       }
> >
> >       return ret;
> The reason I did this was to preserve the value of ret as the caller of
> the function checks it. Some functions return -EINVAl like in here:
> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/dp/dp_link.c#L972
> , so to check that it would be necessary to get the ret value.

ret is overwritten multiple times. The logic seems to be if ret is
not-zero, reassign it, until we get to the end. How about this

----8<----
diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index 1195044a7a3b..e59138566c0a 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -1027,41 +1027,27 @@ int dp_link_process_request(struct dp_link *dp_link)

 	if (link->request.test_requested == DP_TEST_LINK_EDID_READ) {
 		dp_link->sink_request |= DP_TEST_LINK_EDID_READ;
-		return ret;
-	}
-
-	ret = dp_link_process_ds_port_status_change(link);
-	if (!ret) {
+	} else if (!dp_link_process_ds_port_status_change(link)) {
 		dp_link->sink_request |= DS_PORT_STATUS_CHANGED;
-		return ret;
-	}
-
-	ret = dp_link_process_link_training_request(link);
-	if (!ret) {
+	} else if (!dp_link_process_link_training_request(link)) {
 		dp_link->sink_request |= DP_TEST_LINK_TRAINING;
-		return ret;
-	}
-
-	ret = dp_link_process_phy_test_pattern_request(link);
-	if (!ret) {
+	} else if (!dp_link_process_phy_test_pattern_request(link)) {
 		dp_link->sink_request |= DP_TEST_LINK_PHY_TEST_PATTERN;
-		return ret;
-	}
-
-	ret = dp_link_process_link_status_update(link);
-	if (!ret) {
-		dp_link->sink_request |= DP_LINK_STATUS_UPDATED;
-		return ret;
-	}
-
-	if (dp_link_is_video_pattern_requested(link)) {
-		ret = 0;
-		dp_link->sink_request |= DP_TEST_LINK_VIDEO_PATTERN;
-	}
-
-	if (dp_link_is_audio_pattern_requested(link)) {
-		dp_link->sink_request |= DP_TEST_LINK_AUDIO_PATTERN;
-		return -EINVAL;
+	} else {
+		ret = dp_link_process_link_status_update(link);
+		if (!ret) {
+			dp_link->sink_request |= DP_LINK_STATUS_UPDATED;
+		} else {
+			if (dp_link_is_video_pattern_requested(link)) {
+				ret = 0;
+				dp_link->sink_request |= DP_TEST_LINK_VIDEO_PATTERN;
+			}
+
+			if (dp_link_is_audio_pattern_requested(link)) {
+				dp_link->sink_request |= DP_TEST_LINK_AUDIO_PATTERN;
+				ret = -EINVAL;
+			}
+		}
 	}

 	return ret;
