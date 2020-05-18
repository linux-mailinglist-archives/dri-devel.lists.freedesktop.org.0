Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC5A1D8B80
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 01:14:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 053BA6E247;
	Mon, 18 May 2020 23:14:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 417AC6E247
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 23:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589843644;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dygxhyFAcoL/md7oaLSs9lle6s1MOyXv/O7rvTlhaVI=;
 b=fFNwueczJyJst9MjmMLFluNQQdcN9K764Y1arwE/+YZos87Pa1LbCIOP6ZLXiMDf55SOUu
 undV1yMmPc46FJmhTlSgPBTurQWmKjXX355i8MfQG699dujHAszvS6blBYYOO47SytHnRy
 7MyJGOh8sVJpPvVqnW6CoIg27LqrVXE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-9LmHRidoN82NjWhDYVmetA-1; Mon, 18 May 2020 19:14:00 -0400
X-MC-Unique: 9LmHRidoN82NjWhDYVmetA-1
Received: by mail-qv1-f71.google.com with SMTP id w6so12982238qvj.4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 16:14:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=dygxhyFAcoL/md7oaLSs9lle6s1MOyXv/O7rvTlhaVI=;
 b=DgweEJOtpqX/+Tm035GGPZGMVemFn/eaegDOV1BY8QYGNshDEDpcXlu39QKcIFKGhH
 xKDiJatPW1eToZiXgu5+yTSjiUs5vQTYTsGya/kJh8/jFS8tDUheDIFWcNZw6BSrU2Ep
 iuV9k4mKmQDm6R/nwuxBRurbizF0mR6swFY+jpd/YJ4IEB7VlJXYGTSb+lfjTsE0Yo2i
 xfQhszekD6t5yeYHpqTRiKCUq6QFltc6gZCZ8F1IUno3gfw1He7hZl7vUFiEBCEOoysq
 lkjfEZLxME9MCLVNCEPdEWBPtbUoXat5caqZqoSrY1icCWmONe0NCCzlKRwv9o5wHmID
 2Iqw==
X-Gm-Message-State: AOAM533t+AGng1OQjOQ7R1js4OgsIZvxJs0gUEjf5piFzSs0jakF9YZz
 JYbPFB8O799gr/IeDv526qY+NidtXfze7ZQ6TMsR0nH061rRcyCCF/vgtIGhg2mcLi+uWxGn9Aa
 SumtHjoQjdD7/a9xMQd/Bkr+8kkR3
X-Received: by 2002:ae9:e712:: with SMTP id m18mr19288065qka.11.1589843640094; 
 Mon, 18 May 2020 16:14:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLinZ9CIuw/9MJ03jMyuOXIkeEtcwsL+ulsziQFIXCmi2mQynhx55cWE1Zd//fESIL8/dsHw==
X-Received: by 2002:ae9:e712:: with SMTP id m18mr19288035qka.11.1589843639770; 
 Mon, 18 May 2020 16:13:59 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (static-173-76-190-23.bstnma.ftas.verizon.net. [173.76.190.23])
 by smtp.gmail.com with ESMTPSA id q17sm9398906qkq.111.2020.05.18.16.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 16:13:59 -0700 (PDT)
Message-ID: <afc19ae508137f18996f2cb11312d232e89eaf59.camel@redhat.com>
Subject: Re: [PATCH] Lenovo X13 Yoga OLED panel brightness fix
From: Lyude Paul <lyude@redhat.com>
To: Mark Pearson <mpearson@lenovo.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Date: Mon, 18 May 2020 19:13:58 -0400
In-Reply-To: <720829f7946b42fb50ca071b0321cf89650affa7.camel@redhat.com>
References: <SG2PR03MB3324FE6FB77A226167E9BC31BDB80@SG2PR03MB3324.apcprd03.prod.outlook.com>
 <720829f7946b42fb50ca071b0321cf89650affa7.camel@redhat.com>
Organization: Red Hat
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Reply-To: lyude@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ok-actually, I'm not sure dim will actually allow me to push this because this
never hit dri-devel as a properly formatted patch (because of the --------------
---------- you put at the top of the branch confusing things)

Can you try again without adding any comments, and ideally see if lenovo can
make it so you can just use git send-email? (unfortunately you're really not
going to be able to work around this if you'll need to be submitting patches
more regularly in the future I'm afraid)

On Mon, 2020-05-18 at 18:43 -0400, Lyude Paul wrote:
> Yeah, git send-email is kinda :(, but unfortunately the entire kernel uses
> this
> workflow. Hopefully freedesktop's gitlab efforts will change this someday...
> 
> also - in the future, if you don't want comments to appear in the patch when
> they're applied put them below the ---, e.g. the one before the Reviewed-by:
> tag.
> 
> Anyway-I'll go ahead and push this, thanks for keeping this list up to date!
> 
> On Mon, 2020-05-18 at 00:06 +0000, Mark Pearson wrote:
> > Hi,
> > 
> > Patch to fix an issue controlling the brightness of the OLED panel on the
> > Lenovo X13 Yoga 
> > Please let me know any feedback or questions.
> > Note - apologies if this message has shown up before - I had some mail
> > client
> > issues.
> > 
> > Mark Pearson
> > ---------------------------------
> > 
> > Add another panel that needs the edid quirk to the list so that brightness 
> > control works correctly. Fixes issue seen on Lenovo X13 Yoga with OLED panel
> > 
> > Co-developed-by: jendrina@lenovo.com
> > Signed-off-by: jendrina@lenovo.com
> > Signed-off-by: Mark Pearson <mpearson@lenovo.com>
> > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > ---
> > drivers/gpu/drm/drm_dp_helper.c | 1 +
> > 1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_dp_helper.c
> > b/drivers/gpu/drm/drm_dp_helper.c
> > index c6fbe6e6bc9d..41f0e797ce8c 100644
> > --- a/drivers/gpu/drm/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/drm_dp_helper.c
> > @@ -1313,6 +1313,7 @@ static const struct edid_quirk edid_quirk_list[] = {
> >                { MFG(0x06, 0xaf), PROD_ID(0xeb, 0x41),
> > BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
> >                { MFG(0x4d, 0x10), PROD_ID(0xc7, 0x14),
> > BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
> >                { MFG(0x4d, 0x10), PROD_ID(0xe6, 0x14),
> > BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
> > +             { MFG(0x4c, 0x83), PROD_ID(0x47, 0x41),
> > BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
> > };
> > 
> >  #undef MFG

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
