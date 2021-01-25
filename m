Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A019A303804
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 09:37:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32F696E416;
	Tue, 26 Jan 2021 08:37:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7A96E30D
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 22:17:12 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id j13so17463469edp.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 14:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nbl4vYmOplOA4Lq7CQdKDQ8xv1fDV6QEwMKrOn8OWpk=;
 b=RcDPBKKUsQj1Z4XdOLYXxLa+oM5qnvGoWPmrbT3/a8Lqu4Hm9ULliPRFkn92MsEbFp
 b8ymLVSD2SDV4OxZVZ5z+0f+HQ2rIRrjYZkvfozqtYSxMl5xuBnqc73lKMrVpOFNI0M6
 sBzTDv358rUoKKrBFzB37brJ1pT5I+WMzCbSJgF2LXqIKQqXdhgzOTXGFOHFE7hCjs0H
 ALFFown2sfzHL7FmiEaAeeYj8NGyIfCanYTrCLNb+ZXAANEFbrDfaKhwPL0VyhmaWjDF
 QHOk36DofKvLN5tisRFt0G0EcnHVSDqrcp2YZNGcFJzrL4JvMDKhgwYnnJ0MOVY/dnVB
 uI0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nbl4vYmOplOA4Lq7CQdKDQ8xv1fDV6QEwMKrOn8OWpk=;
 b=edlBZ0DGY4pp4Pt/zRNgL5o4CX81fSZ+l1m4Q27VUDwxI+aaQcBDUgyzmFRo35drCy
 UdI3EZWceF1cWUp6pI3TNa9o1PKEOgQymQjxOErdEwW/8twl5owxa6pgpHJMZWPavIZ0
 knqBQea2pjGBH0SW3wWMXIK0qvBrS87wNu0lhKhn1Ph8blBogxMewZTJEW4UNmdmKgnv
 7ynU9X5Hmz81snE5Kz8p2u3QxEiqGYgq18qvZahe+vAYB2+4lgg/pIS4F2oxxaDSPFQm
 I/BgYZx7qe2ahZ3+b58GKRJgm0uqQxgs7An6dS9fraZbJMyIlUkCFqL32S8gH+5kSlrJ
 GLRQ==
X-Gm-Message-State: AOAM533ycjV5xR5lzXcNaP2EsPFyMEw/l6C5QgJpEV3nzN8lGuu66eyW
 tllFBNyaYfw6rtYXiHNW5aw=
X-Google-Smtp-Source: ABdhPJwwLFj4N52eEZmA6AnsFi19fslG5VI/m8v0kLBGwk4tb/fd7PVbo1MDWSnDFifpo61Are6skw==
X-Received: by 2002:aa7:d0cf:: with SMTP id u15mr2250287edo.115.1611613031193; 
 Mon, 25 Jan 2021 14:17:11 -0800 (PST)
Received: from localhost (ipbcc330a5.dynamic.kabel-deutschland.de.
 [188.195.48.165])
 by smtp.gmail.com with ESMTPSA id x9sm8872401ejd.99.2021.01.25.14.17.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Jan 2021 14:17:10 -0800 (PST)
Date: Mon, 25 Jan 2021 23:17:01 +0100
From: Oliver Graute <oliver.graute@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1] drm/panel: simple: add SGD GKTW70SDAD1SD
Message-ID: <20210125221701.GA20107@ripley>
References: <20210108214313.GA7979@ripley>
 <CAOMZO5AXgeGYt4+4NMBRL1Hm-9M4X2DngdEBsJEAHq8+MRhQgQ@mail.gmail.com>
 <20210110153532.GA7264@ripley>
 <CAOMZO5C_hDWeVrCh7k+3OiA0jhQfawhGWE6hxnnFn=wA+dkTGQ@mail.gmail.com>
 <20210110200606.GD7264@ripley>
 <CAOMZO5DJUm4zutTB1oi5M0zj4_PFZEAbGzX6_LUAkX_dvEz=Qg@mail.gmail.com>
 <20210116124856.GA3406@portage>
 <CAOMZO5DKann0ojZrhjyXOqrRq9owtgrrZTGwttD_bU0-KO=aBg@mail.gmail.com>
 <20210125212917.GA4177@portage>
 <CAOMZO5DiTDQneYMtNBDpyqtYUYJ3AZ_fqWNSyfxWB5AfaNfULg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOMZO5DiTDQneYMtNBDpyqtYUYJ3AZ_fqWNSyfxWB5AfaNfULg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Tue, 26 Jan 2021 08:37:37 +0000
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
Cc: David Airlie <airlied@linux.ie>, Marco Felsch <m.felsch@pengutronix.de>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/01/21, Fabio Estevam wrote:
> Hi Oliver,
> 
> On Mon, Jan 25, 2021 at 6:29 PM Oliver Graute <oliver.graute@gmail.com> wrote:
> 
> > Ok I fixed the pin conflict with regulator-gpio and added a 5V
> > regulator node in my dts file. Now the display is working fine!
> 
> That's good news :-)
> 
> > I'll post the dts files soon and check if there is something to
> > improve for this patch.
> 
> Did the panel patch I sent earlier work?
> https://pastebin.com/raw/diTMVsh8
> 
> If it does, I can send it formally if you want.

I would prefer mine, because I got a wrong colored penguin on bootup
with yours :-)

Best regards,

Oliver
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
