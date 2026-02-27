Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMtbLyakoWlxvQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 15:03:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D051B845A
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 15:03:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA4C10EB8A;
	Fri, 27 Feb 2026 14:03:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Sr7DMt0Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5544B10EB8A
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 14:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772200992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oV2BIg3dhsX9PonNzGGB5cY2QemaB9h/4eyj8OI7C6o=;
 b=Sr7DMt0Qf7a4MHqdkKNmmGBCUsZYBIUB7kPwn3EeWNYIb2+TgpcqtCw7uxP8DPKVw/Kmed
 RlmmTiMbns5BkT29HHV8I8MefoqSzTVIMoxSxDyOtqVHeO/8zzU4/PZLUz9Boimj6g72i6
 fM/FEr22Hiz8LzoqmynD0YCUea/JRYQ=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-s0ovyp7JP7OctmKRuV28sw-1; Fri, 27 Feb 2026 09:03:11 -0500
X-MC-Unique: s0ovyp7JP7OctmKRuV28sw-1
X-Mimecast-MFC-AGG-ID: s0ovyp7JP7OctmKRuV28sw_1772200990
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-3591c9cb81eso7565933a91.2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 06:03:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772200990; x=1772805790;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oV2BIg3dhsX9PonNzGGB5cY2QemaB9h/4eyj8OI7C6o=;
 b=QLd11k63d1Ui6CTprDw0MmC+iUtZeEypgvbBRbckoVlCboHLPimc4aaXhANbi6by3q
 UyNtgx7Zc3sJI265g+Uu+n9f9ONmcm++4imQNcUiMNH11nX51KYuzh8U+QSbndpgcDKu
 +NmVs4thk8FHg6lBG/ZxRUGs7rT8WMfplQHgikYd4qz9FQHFfrEIN5GyA6aTnMrAwlj9
 qlugjJNGOst7BuC3WNLV1q8Ig+7LTLT4uNzz4BaG0sllh1BV/F3D2LC+MP0BDcy7cFtg
 9w/kvilq9U6rCkH2Rx/9EkC6mIszNWUfvCgcY5C18PIdfQAO4d+nFiBlkjoumA0MkRaZ
 991w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtsKzd5MngR0q+haFe7ATPPZ0YtaS0H+1E6BhpEI4esTIgd5dqyeL1TsOyc+CMeFIsxyptBr+vGWo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz49A7H9G+o4MiKr8VNG7fEpz7CiHFF1ZFu9nSnxawhOdAmDf1T
 ltbEhivHpSBW2JL1dXeZhBKIPUqRZGsfnjp/iYNkYbbAmqF+hm/g6py2Tus7RMmJClol+uUIp1W
 qD6z8tNXE2+J8NbtejFpBC5EPCaG+cdg7H/8FtjoBuwWlE5TlljvQkghoamPf1q5SUHawYai7C/
 q9uhDx
X-Gm-Gg: ATEYQzyjqUfHGxYrAu+2NaA1wF91rLXvlDAC6DF482TwnzgssrFextNTxJs2Ey7mckx
 vJBWmzM7fZIhgLLsps9PsLY1OrJSbnX2CfATAbEw5FBiurVoZDS1/jTf+sgzAldB+k/beO5+6ZE
 wSKkRz3mgZ7bnnLtMsnA6gOmp4zvkovPjyOgNiJSBewaUclRudBuNeggI3FQpZtcT5ghMOT59oq
 YMnVp0c4bNvI7t1XGHBNp/B1jpIkhSm0NoG4luA1zYZd/RYnFmQc0wpyxfK1ZMic/eZe7K9LT1v
 hV3IIHskDkAgtADjbKBpdRsNthd/t0+fz90ZJvzU/Rqss8ZPDrR/I5q6QhU26/OcHEzR5o8VCI8
 EVVEZFcLM/c82tIbbC7lyaMHt6m4mo4wgiqBLVjBwDd1z4EaGNtEXYw==
X-Received: by 2002:a17:90b:5710:b0:341:88c9:6eb2 with SMTP id
 98e67ed59e1d1-35965c3385fmr2137019a91.1.1772200989852; 
 Fri, 27 Feb 2026 06:03:09 -0800 (PST)
X-Received: by 2002:a17:90b:5710:b0:341:88c9:6eb2 with SMTP id
 98e67ed59e1d1-35965c3385fmr2136984a91.1.1772200989423; 
 Fri, 27 Feb 2026 06:03:09 -0800 (PST)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb
 ([2601:1c2:4400:eb20:99f3:ffd5:11da:6745])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35913269232sm5305497a91.5.2026.02.27.06.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 06:03:09 -0800 (PST)
Date: Fri, 27 Feb 2026 06:03:07 -0800
From: Jared Kangas <jkangas@redhat.com>
To: Larisa Grigore <larisa.grigore@oss.nxp.com>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, chester62515@gmail.com,
 cosmin.stoica@nxp.com, adrian.nitu@freescale.com,
 stefan-gabriel.mirea@nxp.com, Mihaela.Martinas@freescale.com,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 s32@nxp.com, imx@lists.linux.dev, clizzi@redhat.com,
 aruizrui@redhat.com, eballetb@redhat.com, echanude@redhat.com
Subject: Re: [PATCH 00/13] Add DMA support for LINFlexD UART driver
Message-ID: <aaGkGwbk-sh0YJqj@jkangas-thinkpadp1gen3.rmtuswa.csb>
References: <20260216150205.212318-1-larisa.grigore@oss.nxp.com>
MIME-Version: 1.0
In-Reply-To: <20260216150205.212318-1-larisa.grigore@oss.nxp.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vDoBBy0Go0eI-A5xKF-Ihhc6tNjCFP6mRdUewtpJvvc_1772200990
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,linaro.org,amd.com,gmail.com,nxp.com,freescale.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev,redhat.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:larisa.grigore@oss.nxp.com,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:chester62515@gmail.com,m:cosmin.stoica@nxp.com,m:adrian.nitu@freescale.com,m:stefan-gabriel.mirea@nxp.com,m:Mihaela.Martinas@freescale.com,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:s32@nxp.com,m:imx@lists.linux.dev,m:clizzi@redhat.com,m:aruizrui@redhat.com,m:eballetb@redhat.com,m:echanude@redhat.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER(0.00)[jkangas@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[jkangas@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: F1D051B845A
X-Rspamd-Action: no action

Hi Larisa,

On Mon, Feb 16, 2026 at 04:01:52PM +0100, Larisa Grigore wrote:
> This patchset enhances the LINFlexD UART driver and its device tree bindings to
> support DMA transfers, configurable clock inputs, dynamic baudrate changes, and
> termios features. It also includes a series of fixes and improvements to ensure
> reliable operation across various modes and configurations.
> 
> The changes added can be summarized as follows:
> 1. Fixes with respect to FIFO handling, locking, interrupt related registers and
> INITM mode transition.

Tested this series with the default devicetree configuration by booting
the board to a login prompt about 200 times. Without the series applied,
I was seeing a bug roughly every 30-50 boots where the kernel would
would hang in linflex_console_putchar() waiting for DTFTFF. In my tests
with the series applied, I didn't see any regressions and the bug no
longer appeared. Thanks for the fix!

Tested-by: Jared Kangas <jkangas@redhat.com> # S32G3, interrupt-driven

> 2. Removal of the earlycon workaround, as proper FIFO handling and INITM
> transitions now ensure stable behavior.
> 3. Support for configurable stop bits and dynamic baudrate changes based on
> clock inputs and termios settings.
> 4. Optional DMA support for RX and TX paths, preventing character loss during
> high-throughput operations like copy-paste. Cyclic DMA is used for RX to avoid
> gaps between transactions.
> 
> Larisa Grigore (8):
>   serial: linflexuart: Clean SLEEP bit in LINCR1 after suspend
>   serial: linflexuart: Check FIFO full before writing
>   serial: linflexuart: Correctly clear UARTSR in buffer mode
>   serial: linflexuart: Update RXEN/TXEN outside INITM mode
>   serial: linflexuart: Ensure FIFO is empty when entering INITM
>   serial: linflexuart: Revert earlycon workaround
>   serial: linflexuart: Add support for configurable stop bits
>   serial: linflexuart: Add DMA support
> 
> Radu Pirea (5):
>   serial: linflexuart: Fix locking in set_termios
>   dt-bindings: serial: fsl-linflexuart: add clock input properties
>   dt-bindings: serial: fsl-linflexuart: add dma properties
>   serial: linflexuart: Add support for changing baudrate
>   serial: linflexuart: Avoid stopping DMA during receive operations
> 
>  .../bindings/serial/fsl,s32-linflexuart.yaml  |  31 +
>  drivers/tty/serial/fsl_linflexuart.c          | 972 +++++++++++++++---
>  2 files changed, 846 insertions(+), 157 deletions(-)
> 
> -- 
> 2.47.0
> 

