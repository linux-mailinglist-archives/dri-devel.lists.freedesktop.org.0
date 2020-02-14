Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EAD160D03
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 09:22:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E752A6E875;
	Mon, 17 Feb 2020 08:20:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A39D6E566
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 08:44:03 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id k11so9909851wrd.9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 00:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZXq1qTTEJGxPRttgekd5c81xjN3eOF8wuB+0NRpZEVw=;
 b=PPZBvwhalZ1ByZiC5h4/2jZ0bic0Xxq4NIJxlOqDuxVEzVLkWTlypUMH4BF2ZY1GhA
 YLQwvs062k26eMuXSkUoQEdIVSVJ+yA++89VxJW8rgY7d/YRrOrwGpJ5JGEWLotutAF0
 cv4LS6M2UJOxvrkh/m6bOuIhPrL+dg6Wa9Pl7kV/9INMi9GrszTM0RU1ujwB5hp4cFR6
 0FmHv3z51S3uElm0MyKZQ+R1wXGCf9AARlEJyczDobDoX8oU2r+G1PMVbsa1WLCxMZpU
 gVnPfJ/OVnWYLH/ApiOs8J74UEMIyBostXo+Jot0rNsM16fieYijlHv8+zTU/6b1mdZy
 U2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZXq1qTTEJGxPRttgekd5c81xjN3eOF8wuB+0NRpZEVw=;
 b=e/VsPkJV8dC6J1kWGnmAUHuGkn9UxP/du0rgbTc9X16jBjwmGrBp6hLOJuFRsQMx2z
 BxBrqo6IgYJGkw6Addw/QL/3IRLHW1IDMc1vYx1RUDBr6FSHhBncGw6GMSBw8A8WdJ5s
 YxVjuSykBq7kcmkKKICMZx9L2JkQJmNrdAuMfgRu02q23zA36w0KoqORcaCRivi41sQr
 q5MagaxDE/UsfKuGBgaiv8D56yfSD+vPD0Ftm34T1Yhz+irG4Vt9qZjwI8z3bPPv2Nkk
 s09hTE2oavKqWQk2NzzIWCmRlHOY6NbYUMi3N0oV6Cbgxvdl6taT5WMmGTi9Hd+SozUm
 XSzw==
X-Gm-Message-State: APjAAAVEhCiHzrp4jls3K1oAUtn/Q9hdIfpy7OkQvQin2Kl6ZF9NmY7/
 Eu2i/BxLr+37y+nGuW94dMI=
X-Google-Smtp-Source: APXvYqxS/TScRSLlqJlyhr//zA4jaFbzxneoXDXkbl4duj/BRqbmb25+lDDvv1nUh4I6g8T3WVp2Cw==
X-Received: by 2002:a5d:4e0a:: with SMTP id p10mr2868980wrt.229.1581669841655; 
 Fri, 14 Feb 2020 00:44:01 -0800 (PST)
Received: from kedthinkpad ([213.197.144.54])
 by smtp.gmail.com with ESMTPSA id s139sm6677722wme.35.2020.02.14.00.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 00:44:00 -0800 (PST)
Date: Fri, 14 Feb 2020 10:43:58 +0200
From: Andrey Lebedev <andrey.lebedev@gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 2/2] ARM: sun7i: dts: Add LVDS panel support on A20
Message-ID: <20200214084358.GA25266@kedthinkpad>
References: <20200210195633.GA21832@kedthinkpad>
 <20200212222355.17141-2-andrey.lebedev@gmail.com>
 <20200213094304.hf3glhgmquypxpyf@gilmour.lan>
 <20200213200823.GA28336@kedthinkpad>
 <20200214075218.huxdhmd4qfoakat2@gilmour.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200214075218.huxdhmd4qfoakat2@gilmour.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Mon, 17 Feb 2020 08:20:47 +0000
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
Cc: airlied@linux.ie, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrey Lebedev <andrey@lebedev.lt>, wens@csie.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 14, 2020 at 08:52:18AM +0100, Maxime Ripard wrote:
> > > This will create a spurious warning message for TCON1, since we
> > > adjusted the driver to tell it supports LVDS, but there's no LVDS
> > > reset line, so we need to make it finer grained.
> >
> > Yes, I can attribute two of the messages in my dmesg log [1] to this
> > ("Missing LVDS properties" and "LVDS output disabled". "sun4i-tcon
> > 1c0d000.lcd-controller" is indeed tcon1). And yes, I can see how they
> > can be confusing to someone.
> >
> > I'd need some pointers on how to deal with that though (if we want to do
> > it in this scope).
> 
> Like I was mentionning, you could introduce a new compatible for each
> TCON (tcon0 and tcon1) and only set the support_lvds flag for tcon0

Can you give me an idea how that compatible might look like?

		tcon0: lcd-controller@1c0c000 {
			compatible = "allwinner,sun7i-a20-tcon", "allwinner,lvds";

or

		tcon0: lcd-controller@1c0c000 {
			compatible = "allwinner,sun7i-a20-tcon", "allwinner,tcon0";

? Or something completely different?


-- 
Andrey Lebedev aka -.- . -.. -.. . .-.
Software engineer
Homepage: http://lebedev.lt/
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
