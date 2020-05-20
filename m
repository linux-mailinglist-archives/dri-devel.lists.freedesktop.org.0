Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB561DB34B
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 14:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B70DA89107;
	Wed, 20 May 2020 12:32:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54566E83E
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 12:32:45 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id f134so2386762wmf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 05:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/deUJnTldSvb/fI/BuOywc8/Or2D1dLy+43R64sSykQ=;
 b=KTzb8QOjD+49px1rebn6enlaJ8SuaiylzhRLQ9b6WNwYgko/Dk+4fOm/W+FhtxmhmB
 68bXxxrNWntFGbIrXVQn4Fn5NI81lChPnv/5cJLb43pcnskSbLneibnlbdwroi9m02V1
 CDMdWoKt/PNKJMftm12ZTg0rmulUbVaS4X8IQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/deUJnTldSvb/fI/BuOywc8/Or2D1dLy+43R64sSykQ=;
 b=IHazlulBINekFyJHLoOvZz3v92zIz5TuN0VNMpyzWlHull4J+FSzR3uhTm+HdrkdP/
 wRfCcvesiIkR4RHQQv+kbXGWPeGrpkVprZ7GAsH4pqUaptqNQcUqIJXl15VMGIqqNuhk
 eSnnO6lL77RNvX/hofsJehppql5WlYIZeTSFJrxwOOuXpdoVFgjxnPd/cCpEj7rSfhzB
 yxIMMhwtyFcPmVoejs7Rgan0660wBXC7wNuQcb1ypdQRRzAoI9ipP/L57maxgaccH8wl
 yl9mcyPHcnYYFr/ICAxPORB5MsxhytuxEd76ROeBUEeuzPT9TRtb3LKf3oKSCB7GGlSU
 zQZg==
X-Gm-Message-State: AOAM532+7O7CegMY+BQugRBSAK6kEvsZIJ1MrkmvdKCvcQp526qqrXSt
 Wre3Xhp3O1DZjtRQo5dBXlTnIg==
X-Google-Smtp-Source: ABdhPJxJ0tqiZ7hvCYPBf3Hnry7UOh7Ankb5afwSlyf3TqILvQUkeyPTDev3pouMYQMN6Zzg6FbOxQ==
X-Received: by 2002:a05:600c:2dd7:: with SMTP id
 e23mr4398854wmh.96.1589977964372; 
 Wed, 20 May 2020 05:32:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l12sm3071803wrh.20.2020.05.20.05.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 05:32:43 -0700 (PDT)
Date: Wed, 20 May 2020 14:32:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH] Lenovo X13 Yoga OLED panel brightness fix
Message-ID: <20200520123241.GU206103@phenom.ffwll.local>
References: <SG2PR03MB3324FE6FB77A226167E9BC31BDB80@SG2PR03MB3324.apcprd03.prod.outlook.com>
 <720829f7946b42fb50ca071b0321cf89650affa7.camel@redhat.com>
 <afc19ae508137f18996f2cb11312d232e89eaf59.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <afc19ae508137f18996f2cb11312d232e89eaf59.camel@redhat.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Mark Pearson <mpearson@lenovo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 18, 2020 at 07:13:58PM -0400, Lyude Paul wrote:
> ok-actually, I'm not sure dim will actually allow me to push this because this
> never hit dri-devel as a properly formatted patch (because of the --------------
> ---------- you put at the top of the branch confusing things)
> 
> Can you try again without adding any comments, and ideally see if lenovo can
> make it so you can just use git send-email? (unfortunately you're really not
> going to be able to work around this if you'll need to be submitting patches
> more regularly in the future I'm afraid)

Other option is hand-edit the patch and then manually add the msg-id
reference with dim add-links (or whatever it was) so the archive links are
too much off. That should work all somehow.

Still yeah gitlab mr would be neater.
-Daniel

> 
> On Mon, 2020-05-18 at 18:43 -0400, Lyude Paul wrote:
> > Yeah, git send-email is kinda :(, but unfortunately the entire kernel uses
> > this
> > workflow. Hopefully freedesktop's gitlab efforts will change this someday...
> > 
> > also - in the future, if you don't want comments to appear in the patch when
> > they're applied put them below the ---, e.g. the one before the Reviewed-by:
> > tag.
> > 
> > Anyway-I'll go ahead and push this, thanks for keeping this list up to date!
> > 
> > On Mon, 2020-05-18 at 00:06 +0000, Mark Pearson wrote:
> > > Hi,
> > > 
> > > Patch to fix an issue controlling the brightness of the OLED panel on the
> > > Lenovo X13 Yoga 
> > > Please let me know any feedback or questions.
> > > Note - apologies if this message has shown up before - I had some mail
> > > client
> > > issues.
> > > 
> > > Mark Pearson
> > > ---------------------------------
> > > 
> > > Add another panel that needs the edid quirk to the list so that brightness 
> > > control works correctly. Fixes issue seen on Lenovo X13 Yoga with OLED panel
> > > 
> > > Co-developed-by: jendrina@lenovo.com
> > > Signed-off-by: jendrina@lenovo.com
> > > Signed-off-by: Mark Pearson <mpearson@lenovo.com>
> > > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > > ---
> > > drivers/gpu/drm/drm_dp_helper.c | 1 +
> > > 1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_dp_helper.c
> > > b/drivers/gpu/drm/drm_dp_helper.c
> > > index c6fbe6e6bc9d..41f0e797ce8c 100644
> > > --- a/drivers/gpu/drm/drm_dp_helper.c
> > > +++ b/drivers/gpu/drm/drm_dp_helper.c
> > > @@ -1313,6 +1313,7 @@ static const struct edid_quirk edid_quirk_list[] = {
> > >                { MFG(0x06, 0xaf), PROD_ID(0xeb, 0x41),
> > > BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
> > >                { MFG(0x4d, 0x10), PROD_ID(0xc7, 0x14),
> > > BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
> > >                { MFG(0x4d, 0x10), PROD_ID(0xe6, 0x14),
> > > BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
> > > +             { MFG(0x4c, 0x83), PROD_ID(0x47, 0x41),
> > > BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
> > > };
> > > 
> > >  #undef MFG
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
