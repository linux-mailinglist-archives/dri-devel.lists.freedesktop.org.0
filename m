Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A617CA468BF
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 19:00:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 236CE10E99A;
	Wed, 26 Feb 2025 18:00:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fnzOFs9c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED4CF10E99A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 17:59:56 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-22128b7d587so368965ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 09:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740592795; x=1741197595; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=aLZRzBzitap92yZk251lvU9DytAtAlhsYa/CQwhvV8Q=;
 b=fnzOFs9cwQjfJZvdwMMMdJoE3A+2pflQB3TrtDBAJl/rg5Vh2V3Z3P1ZLTCrM8UqEF
 CZ6dfIyjkin7GB2rV0fPPsEKQAe7W12iiHqjwSXWnxcqY6VpKkmEGgURLWQIfma7cjoc
 UVQqM9HNSmvhy6SsBtokjOnCFw3VQDd4uJcZNKToo/vXfCyvToRStNtevlLrmZ2mij4l
 FkIv9FBxrp9VO6goV7eFyE5wqEdhmEiisYHQS4Z7UEsbkmd0URerinux0tKat2tIO+6B
 S/Npo1YdhNXWurPoIIeHIuEHspjwQ2KeLjLPylsekQT9iA0pRkMS/gQ35+GbQk6fLPKb
 KakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740592795; x=1741197595;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aLZRzBzitap92yZk251lvU9DytAtAlhsYa/CQwhvV8Q=;
 b=tROvCouzogpGHW4aa8KA2kgyNE65c8D25Saj3aUfOua2jZZgNN3h+HgDjwG78iEVtG
 szOQK62n8uFyyDGID6VIMr+aKwKtOHDb/yhe6rzjvrXfoN+s1e0crARlHcpWZKrGjK4A
 EnDXFJwNMJy6MiBYsPoM4/XvM8h+5l8be7VTgwXhiekwY3UxjICpBNhEzFmQDaHlXI97
 tDmeCwEPr+OXpbtAPEN+kI/yt37/E8Xfsv9T4IUZU5n5R2WrLZxGttknmvisfbPh7ZVR
 yL4f4/m8s8S2jSKfW7IWkSFksmm7RbK7felvQFFQdfbt4R56dV8R4V2NhwIjNZH0a9Rp
 cfTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAx1Qckgd9Yb//MlsLGFgs40jV3FIfAvpBDKO2hyH4IuqUXNZZyUdqXs84vZfndZe3pt9b7Ecgg+Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydGI+m7GEAp0tgdY7NLyGBNIbUa9SOUAC1wAIUxzD4cfjIHQce
 f4ESKIbMUF1hhMc7Y+1CsQ/VwJvfWmtu7c7Pf1A1e9prVTrK6u/2
X-Gm-Gg: ASbGncuY2RuikYaGm+9nrGFBQrUxJlCJzlst/TtwXB3eyRO6VR+Z8hdv6Uqu8FMamZi
 N5oeeWWDQBPGF0NSjCu46dUf8a3IDs2lnffUP58w41zuJO05DPMWc4uKrPCFjzjK4rSMPL7frrC
 eJi4XcN0dF22pjayjU/M6qCFvxDs0YQbog6a+KyjnPQh6CISYlEjz4Kh6RrpN3LDjZjo4FoE7uD
 BgvipwWKo32oyEBmewu9RXvLMSvHhrCguDFsYEXxdtojcpxjecW+/ila/xOdeY+Xynyy2hWG2PJ
 LSYiD614CVbVnl3GS744SdWFWcOs7veT3piWdnaMPgga5cTSU5uTQA==
X-Google-Smtp-Source: AGHT+IFPX6/YemPi/DqumfrbMAfmVM+yJTxaN3xhdxU4AjgnAZPzxKGRLUd3gIiPdvk59fs7FScnAQ==
X-Received: by 2002:a05:6a21:600c:b0:1ee:c74c:2436 with SMTP id
 adf61e73a8af0-1f10ae2ec90mr8029040637.34.1740592795469; 
 Wed, 26 Feb 2025 09:59:55 -0800 (PST)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-aedaab2e8fbsm3541850a12.64.2025.02.26.09.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 09:59:54 -0800 (PST)
Date: Thu, 27 Feb 2025 01:59:44 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 jk@ozlabs.org, joel@jms.id.au, eajames@linux.ibm.com,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dmitry.torokhov@gmail.com, mchehab@kernel.org,
 awalls@md.metrocast.net, hverkuil@xs4all.nl,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 akpm@linux-foundation.org, hpa@zytor.com, alistair@popple.id.au,
 linux@rasmusvillemoes.dk, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 oss-drivers@corigine.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
 bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH 02/17] bitops: Add generic parity calculation for u64
Message-ID: <Z79WkNp6p06fV/f9@visitorckw-System-Product-Name>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-3-visitorckw@gmail.com>
 <Z7zIBwH4aUA7G9MY@thinkpad>
 <Z73FxIv353lbXO3A@visitorckw-System-Product-Name>
 <b5236ae4-7ebe-4a88-bbc9-3b9b3374de53@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5236ae4-7ebe-4a88-bbc9-3b9b3374de53@kernel.org>
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

Hi Jiri,

On Wed, Feb 26, 2025 at 08:14:14AM +0100, Jiri Slaby wrote:
> On 25. 02. 25, 14:29, Kuan-Wei Chiu wrote:
> > > +#define parity(val)					\
> > > +({							\
> > > +	u64 __v = (val);				\
> > > +	int __ret;					\
> > > +	switch (BITS_PER_TYPE(val)) {			\
> > > +	case 64:					\
> > > +		__v ^= __v >> 32;			\
> > > +		fallthrough;				\
> > > +	case 32:					\
> > > +		__v ^= __v >> 16;			\
> > > +		fallthrough;				\
> > > +	case 16:					\
> > > +		__v ^= __v >> 8;			\
> > > +		fallthrough;				\
> > > +	case 8:						\
> > > +		__v ^= __v >> 4;			\
> > > +		__ret =  (0x6996 >> (__v & 0xf)) & 1;	\
> > > +		break;					\
> > > +	default:					\
> > > +		BUILD_BUG();				\
> > > +	}						\
> > > +	__ret;						\
> > > +})
> > > +
> > > +#define parity8(val)	parity((u8)(val))
> > > +#define parity32(val)	parity((u32)(val))
> > > +#define parity64(val)	parity((u64)(val))
> > What do you think about using these inline functions instead of macros?
> > Except for parity8(), each function is a single line and follows the
> > same logic. I find inline functions more readable, and coding-style.rst
> > also recommends them over macros.
> 
> Not in cases where macros are inevitable. I mean, do we need parityXX() for
> XX in (8, 16, 32, 64) at all? Isn't the parity() above enough for everybody?
> And if not, you can have all those parityXX() as inlines as you suggest, but
> also provide a macro such as the above to call (optimized) parityXX() as per
> datatype len.
> 
I agree that we can add a macro to call parity8/16/32/64 based on the
data type size. However, I think we should still keep parity8/16/32/64.
As Peter and David discussed, the x86-specific implementations of
parity8() and parity16() might use different instructions instead of
just XORing and calling another function, as in the generic version.

My current idea is to follow David's suggestion and use
__builtin_parity when there is no architecture-specific implementation.
In lib/, we can provide a generic weak function implementation of
__parity[sdt]i2.

Any comments or suggestions are welcome!

Regards,
Kuan-Wei

static inline parity32(u32 val)
{
    return __builtin_const_p(val) ? _parity_const(val) : _parity32(val);
}

#ifndef _parity32
static inline _parity32(u32 val)
{
    return __builtin_parity(val);
}
#endif

int __weak __paritysi2(u32 val);
int __weak __paritysi2(u32 val)
{
    val ^= val >> 16;
    val ^= val >> 8;
    val ^= val >> 4;
    return (0x6996 >> (val & 0xf)) & 1;
}
EXPORT_SYMBOL(__paritysi2);
