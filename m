Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIlSEgv5dGmO/gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 17:53:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAE97E2D8
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 17:53:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE38E10E338;
	Sat, 24 Jan 2026 16:53:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S0zcbbTl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 497B510E338
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 16:53:28 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4801bc328easo36776465e9.3
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 08:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769273607; x=1769878407; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+BQn+P/UOseTbGGqnJNsSGMZHqICVJmpni1h8D5Uppc=;
 b=S0zcbbTlCXmSBv/DEWW+/dbtRiLN4QjdkCRLZ1B03YXwWrT5p7m717EGGorR2MydXa
 gsASC5bsvRPJjqp/QA0FYCEA/g1avG2tErmHVoUbUYF+eNCfeqlS41PU26AEA2XoOFPV
 fx93f5n/OC6iJtZZwpZ0rQzHzFhVrG7SwHFsjJDRwF8DvS9mgQuY3vdZ0B3G1vxlxHyb
 ULP4s/6l1oKE73H17CBtG1q3QswIBG80CQpUXvy5w/iISUeqqPiKoFftW0hV0SPfHog3
 D8eOYdhUlHxBKjzW+YD3yXhevbF7mJScsAxV1mt7EVM01z4kzgYBmWDwNg4Ys/82xP9u
 uvrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769273607; x=1769878407;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+BQn+P/UOseTbGGqnJNsSGMZHqICVJmpni1h8D5Uppc=;
 b=Rr3v+eYcbBHmYJSpL35D5L36HwdvRPL7WB4nS4vSfDknmP/cFxMN9onkrAJE9J00rp
 Aix15+LZNRrs6vadnDJSgcyNdvOD88sxtI5UuQlbloWHi6/U/0nB0tfqO9j2KwClL2W2
 VB9E5Qrpv4EA21/PHvg3/c2mo16zEJHJn9mNXLSdtSap5wC2P9byT0ak6ioPzCZCe37A
 P2NLdHp7Rw5/7/J08nwD5cIWIYmk5ZyVJgMLGmdwrnNpWAcuxEPqSIRi2OHUqxcaeluF
 YoQUsOlOPKpzvGCNvulL1nST1gTZP05f8zLH0HuycrvjNfqmeZ3yUOY547u+fe3tb5+m
 FpJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmPX6eunJ5oJ4FmgTmA0dg50qF0MLzQNXZIN0zKpKEA+EWB/5j48fVunjF70wTFyqe4JpoGCGJ3oY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbnV1t2inzi8GaYbqhxtVgyFCTAf5ydmapjGew7yvMgnsog5I0
 p+DwNtjpNI0fZHHIiDRK+Wdk8sKvLXplwACtLbWrJQpqfklFf2nLMtNE
X-Gm-Gg: AZuq6aKpGFKwlXK+m9WrmnVB4F2hgS4b6rnZNmziSlvDwlOPysH+aE7MP4zqBtmeKcG
 Esfv4091ZcuEMZg2Ud4AK2JFrEgu3CSdw6aSbX1L6uwaoNVxoCpiTLARehqlpBUoKIRZU7IzWdG
 uYFxmTBA8wMI/Ithdf1xoK5XBE0viDz+nNNpnUPSlV6Ru22SfO/DK/8qIZlxl+r5JwsyRKVHrXY
 O06jINTu2tAu1fF5/t+5YnIPK4gl/p8hkAbtx67qeKCRDJMOWU+mdedYGLtNMim3ibiBnB6dFEa
 e0R8NiKqC3/ArJe8hI7RP7iTr6F/5+m/TvxGSh2dl0JhBCGDzaxK6vzoKkzkuBFM7odogZQx9OC
 8uTOwggF/bXwdY4Hr8NeiEBNQJd/XxFrtUYdzsm1xy3LCKEQZnvtl8TdIs6sQ6ZxETQW/AGL2T2
 c8MGRO+C6f046MH7CkOzR/TQlmmQRFkY2izccayzs65zQ=
X-Received: by 2002:a05:600c:4fd6:b0:480:1d16:2538 with SMTP id
 5b1f17b1804b1-4804c9b21b0mr112717765e9.23.1769273606608; 
 Sat, 24 Jan 2026 08:53:26 -0800 (PST)
Received: from osama ([156.223.77.192]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804d85d146sm148011875e9.8.2026.01.24.08.53.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jan 2026 08:53:26 -0800 (PST)
Date: Sat, 24 Jan 2026 17:53:23 +0100
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Zsolt Kajtar <soci@c64.rulez.org>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 syzbot+7a63ce155648954e749b@syzkaller.appspotmail.com
Subject: Re: [PATCH] fbdev: sys_fillrect: Add bounds checking to prevent
 vmalloc-out-of-bounds
Message-ID: <aXT5A6vBSNIry3os@osama>
References: <20260118001852.70173-1-osama.abdelkader@gmail.com>
 <5bc62c51-308c-483f-a92d-29354f2deeac@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5bc62c51-308c-483f-a92d-29354f2deeac@suse.de>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:soci@c64.rulez.org,m:simona@ffwll.ch,m:deller@gmx.de,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:syzbot+7a63ce155648954e749b@syzkaller.appspotmail.com,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[osamaabdelkader@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[osamaabdelkader@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[c64.rulez.org,ffwll.ch,gmx.de,vger.kernel.org,lists.freedesktop.org,syzkaller.appspotmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[dri-devel,7a63ce155648954e749b];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,suse.com:url,syzkaller.appspot.com:url]
X-Rspamd-Queue-Id: AEAE97E2D8
X-Rspamd-Action: no action

On Mon, Jan 19, 2026 at 08:38:31AM +0100, Thomas Zimmermann wrote:
> Hi,
> 
> thanks for the patch.
> 
> Am 18.01.26 um 01:18 schrieb Osama Abdelkader:
> > The sys_fillrect function was missing bounds validation, which could lead
> > to vmalloc-out-of-bounds writes when the rectangle coordinates extend
> > beyond the framebuffer's virtual resolution. This was detected by KASAN
> > and reported by syzkaller.
> > 
> > Add validation to:
> > 1. Check that width and height are non-zero
> > 2. Verify that dx and dy are within virtual resolution bounds
> > 3. Clip the rectangle dimensions to fit within virtual resolution if needed
> 
> This is rather a problem with the caller of the fillrect helper and affects
> all drivers and all implementations of fb_fillrect. Clipping should happen
> in the fbcon functions before invoking ->fb_con.
> 
> Best regards
> Thomas
> 
> > 
> > This follows the same pattern used in other framebuffer drivers like
> > pm2fb_fillrect.
> > 
> > Reported-by: syzbot+7a63ce155648954e749b@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=7a63ce155648954e749b
> > Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> > ---
> >   drivers/video/fbdev/core/sysfillrect.c | 21 ++++++++++++++++++++-
> >   1 file changed, 20 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/video/fbdev/core/sysfillrect.c b/drivers/video/fbdev/core/sysfillrect.c
> > index 12eea3e424bb..73fc322ff8fd 100644
> > --- a/drivers/video/fbdev/core/sysfillrect.c
> > +++ b/drivers/video/fbdev/core/sysfillrect.c
> > @@ -7,6 +7,7 @@
> >   #include <linux/module.h>
> >   #include <linux/fb.h>
> >   #include <linux/bitrev.h>
> > +#include <linux/string.h>
> >   #include <asm/types.h>
> >   #ifdef CONFIG_FB_SYS_REV_PIXELS_IN_BYTE
> > @@ -18,10 +19,28 @@
> >   void sys_fillrect(struct fb_info *p, const struct fb_fillrect *rect)
> >   {
> > +	struct fb_fillrect modded;
> > +	int vxres, vyres;
> > +
> >   	if (!(p->flags & FBINFO_VIRTFB))
> >   		fb_warn_once(p, "%s: framebuffer is not in virtual address space.\n", __func__);
> > -	fb_fillrect(p, rect);
> > +	vxres = p->var.xres_virtual;
> > +	vyres = p->var.yres_virtual;
> > +
> > +	/* Validate and clip rectangle to virtual resolution */
> > +	if (!rect->width || !rect->height ||
> > +	    rect->dx >= vxres || rect->dy >= vyres)
> > +		return;
> > +
> > +	memcpy(&modded, rect, sizeof(struct fb_fillrect));
> > +
> > +	if (modded.dx + modded.width > vxres)
> > +		modded.width = vxres - modded.dx;
> > +	if (modded.dy + modded.height > vyres)
> > +		modded.height = vyres - modded.dy;
> > +
> > +	fb_fillrect(p, &modded);
> >   }
> >   EXPORT_SYMBOL(sys_fillrect);
> 
> -- 
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
> GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)
> 
> 

Thanks for the info.

Best regards,
Osama

