Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cP41EN3pe2mtJQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 00:14:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DB1B59BD
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 00:14:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068A910E1EA;
	Thu, 29 Jan 2026 23:14:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CsrjllLF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C5110E1EA
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 23:14:32 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4806bf03573so8129405e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 15:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769728471; x=1770333271; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5bYWxa4cZ5/1b/L5Q7G3vedzyBNRqZNi5CVbiTnOSeY=;
 b=CsrjllLFc+7qcd7lsLGXMZHxumojNa30vDWRi7rm67g6et899/PRJMteKAp8o+CIgl
 ggjbmBJd9eLzDglsLlcPHtLk1bCEkx0f+XJ9oNkTxuNtBQmHUb80r0HTHmyEZK0GFeb+
 S8hcfyJ8Hol1IlvXNHv72UHEOWnvBuslWUXVR1C3tHFextdnnPpvFifSzx8FR4pa4oKs
 z3f26pUqyQs9On4qXBc1uuKIcl4ATKMCYlMOZWFT/UKcIySHS9uHyfpQ9zo3GZZNhcRt
 IAoHSlXipVxrJN698+AGbYO6RcmfRk9mebuXKFPbBDaVYO4pDM9duYf8+KIq9qTQ0yjw
 NrHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769728471; x=1770333271;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5bYWxa4cZ5/1b/L5Q7G3vedzyBNRqZNi5CVbiTnOSeY=;
 b=BGOCLUNcUSi3x9WVnfhNj0PwWCKx0oDLpJUeMRpLY/nY0ATkvB5WOSRbadLPIg24Vn
 +za1TXyXmzrxFcJuLR5O/BUAxYJqau2Op5wKAZstXLB+n/nChZTCcJzXLiGWiKa61Yos
 wJ28EI30KH9tRRcjhfSZRI9bnd+ho7uar54/+3n8CGfM8shJymWmfQtDaS4RddHQe3yZ
 wee+R9KfUkrgNGmfSbitAHSUSUZqGtTqolmFwEIClNI2An8T/wmTMFYIt9/VsEaW5Rqh
 eeGV+97CbpJoKx8ig1T79RDNbZwgIT2xioaKiNiAvtpWrqnRoc16FYBCEHfI9RihTUOh
 rlxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNsI3zBU2Pa9UuoAxt1WDcnY0uSL1iFHTYjRzWfdH+PdyQTLpHqZ/2sExPCrualzUnf0omKVM+bXY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjIMyp4v97ZCy6124bj6jaOMJHJi2fxAHXnutoM/+KG+tn+bMY
 S8JJiL3+Mc23GjKyU6DDHla+953n9RzDb3Tq3RZM2XhfUujx4JuFE2wq
X-Gm-Gg: AZuq6aIjbNv/bKdzIv7B/krwd7aMBEMNZozeHgjSyF6pp7qUSi9RkKRN8SFzIX2Qfjw
 zPuNfGwJ5jD/PFYdrHy77FgopCGXWGigDIibFNl+p/Kg0DAN9snFaoDGBFQn2VJgI0RUJMkD2Tb
 VI8RLYWftUpTVC/8CiGIjE2Q/4OSkGR5CIOAaRpMeh46wBEelIgseH3/a3N1VvBnwEOOrwMIq3g
 6bnpUP03cL64/xm3lPE5ZJi09frbvcLfFRYqciEZ4d603F3Haq+mRd8xNJLpgYrUdrp7qnoIBmx
 19lIVq7qZ78GSR2/supsZsDH/rC2TCY3dWY43FEfJYN0IuAOEX1r+qq4Xrf7IpVxIr86K/COGVM
 lts+n+3cIp2LgGsxbaiMDY/Qu2pOIEMoB9tw9BthteC+X8ZVL7X/eEsuQH3YyvJJQ+xfYL9pDKr
 bk0tokZfsRgvxTYuQeMSqd8JkFXi0WK3QMHe6S1NCTCSmREA1Ie85n
X-Received: by 2002:a05:600c:8b27:b0:480:1c85:88bf with SMTP id
 5b1f17b1804b1-482db4998ddmr7562745e9.27.1769728471022; 
 Thu, 29 Jan 2026 15:14:31 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e1354114sm18802203f8f.42.2026.01.29.15.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jan 2026 15:14:30 -0800 (PST)
Date: Thu, 29 Jan 2026 23:14:29 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, srini@kernel.org,
 linux-arm-msm@vger.kernel.org, gregkh@linuxfoundation.org,
 quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v3 3/3] misc: fastrpc: Support mapping
 userspace-allocated buffers
Message-ID: <20260129231429.52f280f9@pumpkin>
In-Reply-To: <CACSVV02ArZQYW0D66wCzcLoegAB+vUODDxfX4Vbt3xpBajRKYg@mail.gmail.com>
References: <20251230110225.3655707-1-ekansh.gupta@oss.qualcomm.com>
 <20251230110225.3655707-4-ekansh.gupta@oss.qualcomm.com>
 <z3tktit6jkxrkre4gm666aw3ql3plyhs6266cu2itrbjbj2das@yjp2pyesoszn>
 <69cb2d42-6672-4c42-935f-e3fff9bf38f8@oss.qualcomm.com>
 <CACSVV02ArZQYW0D66wCzcLoegAB+vUODDxfX4Vbt3xpBajRKYg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:rob.clark@oss.qualcomm.com,m:ekansh.gupta@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:gregkh@linuxfoundation.org,m:quic_bkumar@quicinc.com,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:arnd@arndb.de,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A2DB1B59BD
X-Rspamd-Action: no action

On Thu, 29 Jan 2026 14:11:12 -0800
Rob Clark <rob.clark@oss.qualcomm.com> wrote:


> But looking at the patch, this looks more like mapping an imported
> dmabuf?  Presumably going thru dma_buf_map_attachment() somewhere in
> the existing fastrpc code?

I think I might have had a related problem.
I used dma_alloc_coherent() to get multiple 16kB blocks of kernel memory that
a device can access. The device has an internal 'mmu' that makes them logically
contiguous (from the device point of view).
I then wanted to mmap() a 4k (page) aligned sub-range of that kernel memory
into userspace so that it saw part of the same logically contiguous memory
as the on-device hardware.
Different parts of the devices (max 512 * 16kB) master window are used for
different things, so mmap() offset zero is different for different mmap() requests.
One of the 'old' methods still works provided the pages are physically
contiguous - which isn't the default for systems with an iommu.
IIRC there is a function that will map a single dma_alloc_coherent() allocated
buffer into userspace - but that doesn't let you offset the addresses
not join up multiple buffers.
I can't have been the only person trying to do that?

	David
