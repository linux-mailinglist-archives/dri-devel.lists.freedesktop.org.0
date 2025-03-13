Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A91A5E8E1
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 01:00:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A19C710E091;
	Thu, 13 Mar 2025 00:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NcRCsIti";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A9410E7C3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 00:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741824034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1r40ci8yVvKYx5TjuG331/ukM97GZ3V3opg4w6uboeg=;
 b=NcRCsItiebP1nxuzMyXM1wJ1xS7Bcdv8y9lLvAGy9niHRxJkBWNpVOPjXczBaTTwFHEpM5
 9cYBxhohpQT3Ll1oPdqqpE0mRRvg95utOOn/nRyOD34446zvCDMCBw0Ff64oWxIBu3WSoV
 kWkEGDAGQY5gQTu6hiz5xCPkRbg6VSA=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-343-YoOGfkU3MN-yIqJFtbr2RQ-1; Wed, 12 Mar 2025 20:00:30 -0400
X-MC-Unique: YoOGfkU3MN-yIqJFtbr2RQ-1
X-Mimecast-MFC-AGG-ID: YoOGfkU3MN-yIqJFtbr2RQ_1741824029
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-6fcfa304ef4so7434877b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 17:00:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741824029; x=1742428829;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1r40ci8yVvKYx5TjuG331/ukM97GZ3V3opg4w6uboeg=;
 b=hyEwR/zeFfadqnR06gDSknvFxvvM97tAFIFOTcoPoX7pPng6C8iDStBDE0X2TuihNm
 Zd3E2Jj6Cc0mAwMn5vk3BNOSKk1Dn49LWLJT5mL9FqlI8QVawbcka52O/DO58GI1kHQw
 2YNNSId9cu8/SseGYNyfKRf/yV7ZNEcBbpGDC0iV3XnbZo4b9yA0ZDNw3SM0tA4TTKkV
 I3UXZZkg83u83+u1nxZXJhI5+FVbPmH0tuRTMCrUL7Lq1qn9TJLKm6saPWN73PeJT4UL
 O9ePg5cdwUbs8JUI4z8NAq1M++RD8RqGoNMigbHb7Ecmra85JqfrN3uNwFuzFgz2weho
 ZEoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4en+pKn8I9Y5P5iuOj9xhh9ULww4CyYk4EvWldiYN+geg88AxQrOcC/vUp2MK0psKle1oCWZtMpA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlkQ3xOUe2ylTNPR/RC6SKMrAp8oM2AL5rQMaYM9pGEGVSBAHm
 DWrZecwAMONqEMCSZfa8FYbyWOHmjfYE9BwqzQfjplieCi8w+v0lV66RN60snhISCKNrgBbbIcX
 5OCBG8WwI3Xv5nlco5M+qvqQVGBoZrRmz2spRurQzXgcs8xuJvs7deelNW3KMOj3OlbTqyN8AcC
 DiFle48GsfwdD5w2Lyv0pIny6xaQ1GD/96szA+vSKn
X-Gm-Gg: ASbGncu5eNrieyUbxoEFOUddSoPbKxOFvLdSO9Ra2lNfLAWj8hGLCVbrFFGOB11oAXa
 s/ArargjIuC1q2MI3EIs9LdM573P7nvw4NioHhYZCSR72Et/xjegjJ2DU22g63qWnF162//k=
X-Received: by 2002:a05:690c:fce:b0:6fb:949b:57b with SMTP id
 00721157ae682-6ff2f811c4amr7297337b3.12.1741824029505; 
 Wed, 12 Mar 2025 17:00:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdYAgoMQ79hf85e9jXpqtZVJK29iPJhJZrsFSIA5vrcyWPJKgM67kYfO8Z0sAAqia+BHG5eBiXUie5kx2zQQw=
X-Received: by 2002:a05:690c:fce:b0:6fb:949b:57b with SMTP id
 00721157ae682-6ff2f811c4amr7296947b3.12.1741824029224; Wed, 12 Mar 2025
 17:00:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250310-mipi-synaptic-1-v2-1-20ee4397c670@redhat.com>
 <20250311-warm-icy-rottweiler-cefcdd@houat>
 <CAN9Xe3Qwu=E=VVZZ_8EHPF7Xsk6Zcbp=R_b=cRgF=9SWCkmsqA@mail.gmail.com>
 <CAD=FV=XdngrNhUn8jQ3FGitkBCkiQO1dXnPhCKj+S5Jo8_WUrQ@mail.gmail.com>
In-Reply-To: <CAD=FV=XdngrNhUn8jQ3FGitkBCkiQO1dXnPhCKj+S5Jo8_WUrQ@mail.gmail.com>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 12 Mar 2025 20:00:18 -0400
X-Gm-Features: AQ5f1JoDiu2SfU_IbyjTsztYqI9r2UD4rEAru4GOoGRtSSDFt1BFFC7afI1Iqj4
Message-ID: <CAN9Xe3RQ_L5a+PbXCBbzpn3VxyWEL1_wqA5trY0h=Xj-YMcA1g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel/synaptics-r63353: Use _multi variants
To: Doug Anderson <dianders@chromium.org>, Maxime Ripard <mripard@redhat.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Michael Trimarchi <michael@amarulasolutions.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Tejas Vipin <tejasvipin76@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Rs0nHU87LSJlc0i7ENVWBaqymOptGv_o8KmojN1yblU_1741824029
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000086028d06302e0287"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000086028d06302e0287
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 12, 2025 at 11:48=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg>
wrote:

> Hi,
>
> On Wed, Mar 12, 2025 at 8:06=E2=80=AFAM Anusha Srivatsa <asrivats@redhat.=
com>
> wrote:
> >
> >> > @@ -106,53 +107,46 @@ static int r63353_panel_power_off(struct
> r63353_panel *rpanel)
> >> >  static int r63353_panel_activate(struct r63353_panel *rpanel)
> >> >  {
> >> >       struct mipi_dsi_device *dsi =3D rpanel->dsi;
> >> > -     struct device *dev =3D &dsi->dev;
> >> > -     int i, ret;
> >> > +     struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
> >> > +     int i;
> >> >
> >> > -     ret =3D mipi_dsi_dcs_soft_reset(dsi);
> >> > -     if (ret < 0) {
> >> > -             dev_err(dev, "Failed to do Software Reset (%d)\n", ret=
);
> >> > +     mipi_dsi_dcs_soft_reset_multi(&dsi_ctx);
> >> > +     if (dsi_ctx.accum_err)
> >> >               goto fail;
> >> > -     }
> >>
> >> This changes was definitely not what the script is doing.
> >
> >
> > It isnt. Using coccinelle for the major part of pattern matching and
> replacing the newer _multi variant API. Some handling (including a newlin=
e
> that it introduces) and  the returns depend on a case by case basis, whic=
h
> had to be done manually.
>
> ...and now you're getting to see why I didn't think a coccinelle
> script could fully handle this task. ;-) IMO instead of trying to get
> a coccinelle script to do the full conversion, the right approach
> would be to use a coccinelle script (or equivalent) to get the basics
> done (just so you don't make any typos) and then cleanup the result
> manually. Spending more time on the coccinelle script than it would
> take to do the conversion manually is probably not the right approach.
>
> If your patch wasn't fully generated by a coccinelle script you should
> document that in the commit message. Something like "Initial patch was
> generated by a coccinelle script and the result was cleaned up
> manually." If the script is too long to fit in the commit message,
> it's fine to put it somewhere online and provide a link. "Somewhere
> online" could easily be a mailing list post.
>
>
You know I have been thinking if it makes sense to have this script merged
to coccinelle project and add those details in the commit log.... Was
having an offline discussion with  @Maxime Ripard <mripard@redhat.com>
today and he rightly pointed out that since it is too specific, once all
the conversions are done , the script  would not be further useable....
About having the script online and providing a link, something link a
github link?


Anusha

>
>

--00000000000086028d06302e0287
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 12,=
 2025 at 11:48=E2=80=AFAM Doug Anderson &lt;<a href=3D"mailto:dianders@chro=
mium.org">dianders@chromium.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi,<br>
<br>
On Wed, Mar 12, 2025 at 8:06=E2=80=AFAM Anusha Srivatsa &lt;<a href=3D"mail=
to:asrivats@redhat.com" target=3D"_blank">asrivats@redhat.com</a>&gt; wrote=
:<br>
&gt;<br>
&gt;&gt; &gt; @@ -106,53 +107,46 @@ static int r63353_panel_power_off(struc=
t r63353_panel *rpanel)<br>
&gt;&gt; &gt;=C2=A0 static int r63353_panel_activate(struct r63353_panel *r=
panel)<br>
&gt;&gt; &gt;=C2=A0 {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mipi_dsi_device *dsi =3D rpa=
nel-&gt;dsi;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;dsi-&gt;dev;=
<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0int i, ret;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct mipi_dsi_multi_context dsi_ctx =
=3D { .dsi =3D dsi };<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0int i;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_dcs_soft_reset(dsi);<br=
>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev,=
 &quot;Failed to do Software Reset (%d)\n&quot;, ret);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0mipi_dsi_dcs_soft_reset_multi(&amp;dsi_c=
tx);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (dsi_ctx.accum_err)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fa=
il;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt; This changes was definitely not what the script is doing.<br>
&gt;<br>
&gt;<br>
&gt; It isnt. Using coccinelle for the major part of pattern matching and r=
eplacing the newer _multi variant API. Some handling (including a newline t=
hat it introduces) and=C2=A0 the returns depend on a case by case basis, wh=
ich had to be done manually.<br>
<br>
...and now you&#39;re getting to see why I didn&#39;t think a coccinelle<br=
>
script could fully handle this task. ;-) IMO instead of trying to get<br>
a coccinelle script to do the full conversion, the right approach<br>
would be to use a coccinelle script (or equivalent) to get the basics<br>
done (just so you don&#39;t make any typos) and then cleanup the result<br>
manually. Spending more time on the coccinelle script than it would<br>
take to do the conversion manually is probably not the right approach.<br>
<br>
If your patch wasn&#39;t fully generated by a coccinelle script you should<=
br>
document that in the commit message. Something like &quot;Initial patch was=
<br>
generated by a coccinelle script and the result was cleaned up<br>
manually.&quot; If the script is too long to fit in the commit message,<br>
it&#39;s fine to put it somewhere online and provide a link. &quot;Somewher=
e<br>
online&quot; could easily be a mailing list post.<br>
<br></blockquote><div><br></div><div>You know I have been thinking if it ma=
kes sense to have this script merged to coccinelle project and add those de=
tails in the commit log.... Was having an offline discussion with=C2=A0 <a =
class=3D"gmail_plusreply" id=3D"plusReplyChip-2" href=3D"mailto:mripard@red=
hat.com" tabindex=3D"-1">@Maxime Ripard</a> today and he rightly pointed ou=
t that since it is too specific, once all the conversions are done , the sc=
ript=C2=A0 would not be further useable....</div><div>About having the scri=
pt online and providing a link, something link a github link? <br></div><di=
v><br></div><div><br></div><div>Anusha</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
<br>
</blockquote></div></div>

--00000000000086028d06302e0287--

