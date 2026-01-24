Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKd0I474dGl8/gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 17:51:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E23507E2A2
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 17:51:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B47A310E2C8;
	Sat, 24 Jan 2026 16:51:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SOCsujMl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E31C10E2C8
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 16:51:21 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-432d2c7a8b9so3125707f8f.2
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 08:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769273480; x=1769878280; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Hxw/rJFKy3Zi43PPBn0FyNiBOjhYEoSqVsfDen/FFE0=;
 b=SOCsujMlDZGpcKCeaD3xifEt87H2ryQedDFIhz6qBCQI6jQ8nQzW+yBXCxp/zU6oQ1
 Kt/GNbLNGpQ+YOeluMLslcU259hsGzGrW8Eu5iBPX+PZ/m9t1SZhWzVOf8u79O6wFIlp
 dqeUdBk/GTYvn30K72cgED3F1za7jBc9nsRFWGA6H1xFvE8iui5pp1amfv2bxCFbC5aT
 Was+ejzQ7Hgb/gFPDJ76/VCRiIno/KVdaNQLPtWEzvAY9F8pOngXBbQK8xB32LIwG7NJ
 y6tMErc17UHFjiQmRrh2aYDxepC2qJb2FdcP+0dVJ5eNSWQucx4aNeMUkCYbq7+UfHKx
 mvhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769273480; x=1769878280;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hxw/rJFKy3Zi43PPBn0FyNiBOjhYEoSqVsfDen/FFE0=;
 b=fPBWhwYsmvJuqQgIG+uifl+zZlYGCX+0Iig3ZLU32ReM2GRTtWIdRx4IbdYGF2qc1c
 uoMEHp4jGhUD8gKVfzBskMvd1DReYAr/0veN8HKmEq2ap7Z0+6ougiPcBC4P8UCNjsvI
 BdwX16bWFV5iQt5SonY2JjRZ5IXEJR2eLfrZZ5M9q/2wHBrfD1c7f/zWgNE7q6vbtUit
 6knj5/Dk6SfT/k+lEz6Efri1pDQ/KqDzmIu/qLLohjD4Dc6hklOJ7anuSFikly0FIwS6
 w22rV0Z0PR4j8g/MDDI1Gb9mZGvzdxhjK1FAPspdVZROdWylIgpoOyEl2eZUDEv0aHuc
 IJlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbXMsNz82nf9kEIuY/mhRmMsLSwWZ9BN55wDJyA4KPx0uD+t2t1XVwxr//rhkeTagzkMVWkw8qrXw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0XtovUX2cU6GQ4oJCo1Wgo+kdjEib/G7fuAZLDe52fGgYs56f
 yBjTG1FEADM7rQe0q/mP+Yw8Mg30IFrNz6AHcPm6CSihk/Cvdk9W/Qib
X-Gm-Gg: AZuq6aKJFf0zM39/JBUmQkpP3AyFaZRGAjZRGbnpqWjV2HvUK6lnLnntfBaCEYe9676
 miMH2waBZLwzS0iJIqTFqQhGxTVmbanibnOi4OmevBylpaiVjdrrAP4kl/eV7x6e+FxzB8z2voO
 Pctg8KXy7Dz/xZTe/Hyti/GrNO/Cti9TKBJHOIHtB/OskX8L/8OXm1M3kLSViefxvguZJ5R/5r0
 kMl7ZwEBaFGpb+ZVKglJqB1EuyxlWltwcBeSoaeP7kNgUYWKATZD2w7ETb/rzxr2L6ApTKpjEod
 oVRpy9bjX9WgjRMLHhvNdjKdoIuFSMcAqHbxUavgdsBt1gMwXTBudKZ0uADd/FK7NHCGxlsIcxJ
 +tS1rBVqAJCvjELHvzf4ia5y/3fkfsv6mUKyuyTOUGmrpjQk25mwfsck6yNUU/r39HmlxWla5SN
 hrxNAMo+1FFcNDO0j8RekNSjyhPUo9zMTPO9aNC9bgmvA=
X-Received: by 2002:a05:6000:2886:b0:435:90a7:8db with SMTP id
 ffacd0b85a97d-435b159cadamr12739865f8f.15.1769273479706; 
 Sat, 24 Jan 2026 08:51:19 -0800 (PST)
Received: from osama ([156.223.77.192]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1f73855sm15431440f8f.29.2026.01.24.08.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jan 2026 08:51:19 -0800 (PST)
Date: Sat, 24 Jan 2026 17:51:16 +0100
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, Murad Masimov <m.masimov@mt-integration.ru>,
 Quanmin Yan <yanquanmin1@huawei.com>,
 Yongzhen Zhang <zhangyongzhen@kylinos.cn>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 syzbot+55e03490a0175b8dd81d@syzkaller.appspotmail.com
Subject: Re: [PATCH] fbdev: Fix slab-out-of-bounds read in
 fb_pad_unaligned_buffer
Message-ID: <aXT4hLBy05W8Spy9@osama>
References: <20260118134735.11507-1-osama.abdelkader@gmail.com>
 <7d4b95ff-8a94-4d96-8b75-6153baad9fdf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d4b95ff-8a94-4d96-8b75-6153baad9fdf@suse.de>
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
	FORGED_SENDER(0.00)[osamaabdelkader@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:simona@ffwll.ch,m:deller@gmx.de,m:lee@kernel.org,m:m.masimov@mt-integration.ru,m:yanquanmin1@huawei.com,m:zhangyongzhen@kylinos.cn,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:syzbot+55e03490a0175b8dd81d@syzkaller.appspotmail.com,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[osamaabdelkader@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[ffwll.ch,gmx.de,kernel.org,mt-integration.ru,huawei.com,kylinos.cn,vger.kernel.org,lists.freedesktop.org,syzkaller.appspotmail.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[dri-devel,55e03490a0175b8dd81d];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,syzkaller.appspot.com:url,suse.com:url,bootlin.com:url]
X-Rspamd-Queue-Id: E23507E2A2
X-Rspamd-Action: no action

On Mon, Jan 19, 2026 at 08:45:08AM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 18.01.26 um 14:47 schrieb Osama Abdelkader:
> > The function fb_pad_unaligned_buffer() was reading idx+1 bytes per row
> > from the source buffer, but when mod == 0 (font width is a multiple of
> > 8 bits), the source buffer only has idx bytes per row. This caused a
> > slab-out-of-bounds read when accessing src[idx] after the inner loop.
> > 
> > Fix this by only reading the extra byte when mod != 0, ensuring we
> > never read beyond the source buffer boundaries.
> > 
> > This fixes the KASAN slab-out-of-bounds read reported by syzkaller:
> > https://syzkaller.appspot.com/bug?extid=55e03490a0175b8dd81d
> > 
> > Reported-by: syzbot+55e03490a0175b8dd81d@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=55e03490a0175b8dd81d
> > Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> > ---
> >   drivers/video/fbdev/core/fbmem.c | 18 ++++++++++--------
> >   1 file changed, 10 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> > index eff757ebbed1..a0c4932a6758 100644
> > --- a/drivers/video/fbdev/core/fbmem.c
> > +++ b/drivers/video/fbdev/core/fbmem.c
> > @@ -113,15 +113,17 @@ void fb_pad_unaligned_buffer(u8 *dst, u32 d_pitch, u8 *src, u32 idx, u32 height,
> >   			dst[j+1] = tmp;
> >   			src++;
> >   		}
> > -		tmp = dst[idx];
> > -		tmp &= mask;
> > -		tmp |= *src >> shift_low;
> > -		dst[idx] = tmp;
> > -		if (shift_high < mod) {
> > -			tmp = *src << shift_high;
> > -			dst[idx+1] = tmp;
> > +		if (mod) {
> 
> How do we end up here if mod equals 0? When I look at the callers of this
> function, cases with (mod == 0) take an entirely different branch. [1] [2]
> 
> Best regards
> Thomas
> 
> [1] https://elixir.bootlin.com/linux/v6.18.6/source/drivers/video/fbdev/core/bitblit.c#L208
> [2] https://elixir.bootlin.com/linux/v6.18.6/source/drivers/video/fbdev/core/fbcon_ud.c#L199
> 
> > +			tmp = dst[idx];
> > +			tmp &= mask;
> > +			tmp |= *src >> shift_low;
> > +			dst[idx] = tmp;
> > +			if (shift_high < mod) {
> > +				tmp = *src << shift_high;
> > +				dst[idx+1] = tmp;
> > +			}
> > +			src++;
> >   		}
> > -		src++;
> >   		dst += d_pitch;
> >   	}
> >   }
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

You’re right that callers should only reach this path when mod != 0.
The issue isn’t the mod == 0 case itself, but that the final source byte is read
and consumed even when shift_high >= mod, where no bits are actually used.
I resent a version that only accesses the extra byte when it contributes data.

Best regards,
osama
