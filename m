Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMC4E6sUeWl3vAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 20:40:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB1D9A0B5
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 20:40:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C0A10E5B3;
	Tue, 27 Jan 2026 19:40:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SiHSVppe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA4C410E5B3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 19:40:22 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4806cc07ce7so3291465e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 11:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769542821; x=1770147621; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=b52qO2yFLp3y0SMOMTd2WsGkQfNWU95x2F2WxKXZb6k=;
 b=SiHSVppeCZMkfY0Oyns44fV/jWd1yGjOkYaau1tirVgWZeLZLyBnjuA+9c7FW08lYO
 AMLE0Aj1D5vmD7xmuCjEDXQ8aqPb3QcnG3WjslTxC9hg4s76eho2MF5tpouhH5CW9PAv
 WyLuM+x5kPAXtGBntJHJ2+9jUZrofaig7pHJ8UCQjPYMxGwp/HFoGgLLEOKTrE5ywAlt
 /Z1lHzKGc9BQeTNI1ZhudWj5VjKcaJzc9nwT6V7I01Ja2/7GLVR9vyWabCdvxbu53q0K
 CyydVPLFTOcdmXj+WIrCzL6Efwri79uphcK1BSENuhkNNrJVBSm8paY+zGlijv8nzi4y
 kpBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769542821; x=1770147621;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b52qO2yFLp3y0SMOMTd2WsGkQfNWU95x2F2WxKXZb6k=;
 b=Hc8YXl85yA1B7t3Gj23cj3sYsyAR2/M2/GjnbVYCFD7C/IsNjexnC8ZuzXbViMMJix
 xCrLyrv1sKC4Z9tOu2bOvv9rq0GrxzDzqTCLTLBAYdFqfYEmKGwRqOf0CsleypTLpwEd
 4UswVzn5nUwgj5Pq1gyRUKExyKHcMBXQiZqDogTotmz3qUiB2dxqClsVT+O4UaEyuc3v
 Wo7eCcfWyDj9rep9lJg93vn6aeap1UeEJgu1X8EgA0WJdUjoBiJdiGk6ia8BCv1SkZgV
 flVnFAWLOmXSsrA4Y4oUSdHqBy8smS1hUduqHyvy8UkdOdOKu2nFObD7/28fdn/sLZQ0
 E1Wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUK17FHLGjFk5oRdTu00ecuOwcny4gA6RAMEtF+5DwlHU1lOm19j1/DWVi9l/DuciUjCOyq2YqQ03E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJrrKEhi/9qyrIqAwIqc9CDlSKk7eiFatcOmNaAlmQWDl2ta0G
 +a1sX3tJCTgPQqRIV2fVw6FlIUNMa0WuzylbIDWQZQNQ0SfOCtMMxLEZ
X-Gm-Gg: AZuq6aIifPRvYl2JtTsWPXVfZk1A8hAB9eb9pPorxuIp/Xucfl+Au4L24vcUF+R9utg
 ujSEAmkvYTcNjwj+vTqm0jQOlLbvDEm8W4Zk22z89uKFBstaIMCHAG8sLNkkumBmEOqeO9kuU5v
 03aa6it46w+B3348GUrkuFYQdek14xw25610H/Fpft6G5DEY1emiK7yb6FywdhlcDfOMiV4e4ed
 bjUHo+ENLNFvKvgAijq0536TLUBc+f3JIzcyuBJ/0YW5YCkGkNbUx6U2Jm7CTj2/joBTCfRB2F9
 hl/J94Wyyo2bZeONSy29P2iqh4lym/xEJyKeWktc8ZEudWkn0+K4r/yuhv5qq07U3HwceQK82Dk
 xFre8aR7C1uTzxva6x49NPsfU71YtgVDIzvMCRMm/PsJIJerE+NGqUf2AfP74sANKxy4f3ZHhw6
 GD+mwdZFdA6AIBAW7lGo8saWd46ovKnoOWsQC0YFI=
X-Received: by 2002:a05:600c:350b:b0:47a:935f:61a0 with SMTP id
 5b1f17b1804b1-48069b9a017mr35915635e9.0.1769542821228; 
 Tue, 27 Jan 2026 11:40:21 -0800 (PST)
Received: from osama ([41.37.41.91]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10ee562sm1088358f8f.18.2026.01.27.11.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 11:40:20 -0800 (PST)
Date: Tue, 27 Jan 2026 20:40:15 +0100
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Helge Deller <deller@gmx.de>
Cc: Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>,
 "Daniel Thompson (RISCstar)" <danielt@kernel.org>,
 Murad Masimov <m.masimov@mt-integration.ru>,
 Quanmin Yan <yanquanmin1@huawei.com>,
 Yongzhen Zhang <zhangyongzhen@kylinos.cn>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 syzbot+55e03490a0175b8dd81d@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] fbdev: avoid out-of-bounds read in
 fb_pad_unaligned_buffer()
Message-ID: <aXkUnxhRTB4Kw6ph@osama>
References: <20260124164633.20444-1-osama.abdelkader@gmail.com>
 <889fd11b-80ea-4c23-b47f-4e6b17536b0f@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <889fd11b-80ea-4c23-b47f-4e6b17536b0f@gmx.de>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:lee@kernel.org,m:danielt@kernel.org,m:m.masimov@mt-integration.ru,m:yanquanmin1@huawei.com,m:zhangyongzhen@kylinos.cn,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:syzbot+55e03490a0175b8dd81d@syzkaller.appspotmail.com,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmx.de];
	FORGED_SENDER(0.00)[osamaabdelkader@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[osamaabdelkader@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,55e03490a0175b8dd81d];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: AEB1D9A0B5
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 06:57:32PM +0100, Helge Deller wrote:
> On 1/24/26 17:46, Osama Abdelkader wrote:
> > fb_pad_unaligned_buffer() unconditionally reads and advances the source
> > pointer for the final byte of each row, even when no bits from that byte
> > are actually consumed.
> > 
> > When shift_high >= mod, the remaining bits do not cross a byte boundary,
> > but the code still accesses the next source byte. This can lead to
> > out-of-bounds reads under malformed geometry, as reported by syzbot.
> > 
> > Fix this by only accessing and consuming the final source byte when it
> > contributes bits (shift_high < mod).
> > 
> > This fixes the KASAN slab-out-of-bounds read reported by syzkaller:
> > https://syzkaller.appspot.com/bug?extid=55e03490a0175b8dd81d
> > 
> > Reported-by: syzbot+55e03490a0175b8dd81d@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=55e03490a0175b8dd81d
> > Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> > ---
> > v2: address the real issue (shift_high >= mod) condition.
> > ---
> >   drivers/video/fbdev/core/fbmem.c | 15 +++++++++------
> >   1 file changed, 9 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> > index eff757ebbed1..d125c3db37a1 100644
> > --- a/drivers/video/fbdev/core/fbmem.c
> > +++ b/drivers/video/fbdev/core/fbmem.c
> > @@ -100,7 +100,7 @@ EXPORT_SYMBOL(fb_pad_aligned_buffer);
> >   void fb_pad_unaligned_buffer(u8 *dst, u32 d_pitch, u8 *src, u32 idx, u32 height,
> >   				u32 shift_high, u32 shift_low, u32 mod)
> >   {
> > -	u8 mask = (u8) (0xfff << shift_high), tmp;
> > +	u8 mask = (u8) (0xff << shift_high), tmp;
> 
> This part is correct, but shouldn't be part of this patch.

I just sent a seperate patch for that, and going to remove it in next version of this one.

> 
> 
> >   	int i, j;
> >   	for (i = height; i--; ) {
> > @@ -113,15 +113,18 @@ void fb_pad_unaligned_buffer(u8 *dst, u32 d_pitch, u8 *src, u32 idx, u32 height,
> >   			dst[j+1] = tmp;
> >   			src++;
> >   		}
> > -		tmp = dst[idx];
> > -		tmp &= mask;
> > -		tmp |= *src >> shift_low;
> > -		dst[idx] = tmp;
> > +
> > +		/* Only consume another source byte if it contributes bits */
> >   		if (shift_high < mod) {
> > +			tmp = dst[idx];
> > +			tmp &= mask;
> > +			tmp |= *src >> shift_low;
> > +			dst[idx] = tmp;
> >   			tmp = *src << shift_high;
> >   			dst[idx+1] = tmp;
> > +			src++;
> >   		}
> > -		src++;
> 
> Above you moved the src pointer inside the if(), so every line
> processed may miss a ptr increment. This means the source would need to
> be different too, but it hasn't changed, as it's still used from
> bit_putcs_unaligned() which prints a char from the character fonts.
> 
> So, I believe this part at least is wrong.
> Did you test it?
> 

I couldn't find syzbot's ReproC, so I did minimal one, I will re-test it and write you.
 
> Helge

BR,
Osama
