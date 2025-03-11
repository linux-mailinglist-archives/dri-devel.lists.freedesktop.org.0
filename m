Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CE4A5D231
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 23:01:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F29310E630;
	Tue, 11 Mar 2025 22:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EscGZnwW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 710E610E630
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 22:01:34 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2239c066347so107935115ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 15:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741730494; x=1742335294; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4nGdnQu24c+EnZ9jURP8a6eRlAbk5SN0M0qMNjAtkzg=;
 b=EscGZnwWdxqoaiHJzGdRoWy0+5tFXLF1u58Jz2cBtFgoJ1U7S47/J9u2Ceu2JMZ4ML
 0p5ZhWRxirDzYr0MMTz8AXhhgJ4EthPG5Ig2sx2/naVJ1OfGqTypQvEHHrvm0ulXpmu0
 tvyZ6eKFvB1y9e5wBtvLE/6XviYznyGee3oGyMtaF1GBy5cYiUBZl3iNmkN6ZH/qjMSr
 C1sriOY+OPBn67LTl1Db2U4X3kDRqTA6ZFPvSodMsB3NcZnPa01JOJhR1lBKzrqDYnF7
 AbAAYIFh9DCXavL1Vo6m+FlH0e61yPyVAl6GZo8B9LZjwP7fEvYvOf71/CdN3NilQGTX
 3P8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741730494; x=1742335294;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4nGdnQu24c+EnZ9jURP8a6eRlAbk5SN0M0qMNjAtkzg=;
 b=l+/ctD4VxA2WTD9WOTEl+WZtPlXwpYDj5cOXT/0UYks6o0Mq8Mp6el/Mj4yTCiu6XE
 5uv8b2u1QxzIAy1uLAEWaGsBLok/xmYJajGC70JNVgvyIT+8Rj5KRTSrs7avSs6GTIc/
 AsUWHFZMAk6/++09wBk4PjbwxCDGOralYB5qFkjPnS2ViTUYkuoA9foN4Zq1mTCWe7Bf
 D7dKrlv4fi558JA5DqQ2rDbfXv1IhqdPHJYVeFQ3f9Z2TUMAfNbJubHqPBUQsXwpRQJa
 SvXWJhWouFNxlH5YEnknLIOOftV2VBmWTAA5YekaW9scbyhkNfJXQF5jVn1ZoqXCeeu2
 2alw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHMiWwJ/LH6a5d1IHksu+GlTs0IA/3MhWWNjgxj9IGDlObfj/EBM2zWDS1ClOKeFd8TxCmq772+uE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNNgexh8BDFdJB7cMWZyn4zqqPBwj9pV7om5X4eJIc7/IcnOrP
 TfuLu2SkG2F6XcMJ2VbihFnPu2s0ckPKGzsQxrfEPKFo2rNWrzQp
X-Gm-Gg: ASbGncsmlEidKuYYD1UX5+r3j+jKrphFGR26XMpiqgW1TcLFOBeGkSnY//Qy0C+1ZkK
 i//N35aQj9x3NgcjJsnDmGED3Q4dV/U7XY6Ou/BSoMPyvfedvf7dW2ACN8BSmCLxx3QUtv+IGd6
 0gSLA5lshAnoouTB6Q7W+W3Z16UPhvMbbcZBclZfEhJxwSB+8qaOx4BfdvPvpwhi8d7g7DHfDAT
 BzNHWSHVycUmnDK7425i4J77M/MvhUGtLjrI4FWn3g/LL2YzDLMQLYBQf3wi69g9DCm8iOj3Zn9
 TiSmERTQY7+xU+V7a4g5T92TH79TGzka9A+H5R6l5OYLak00n9Ug14I=
X-Google-Smtp-Source: AGHT+IHfvnoVJgHMih9pvYSUsyOoOI7rh3JUtGAJjtASiqZVTFfrJXIMw23oGqwW4/w5VR3B4dwAMw==
X-Received: by 2002:a17:903:32ce:b0:223:4b8d:32f1 with SMTP id
 d9443c01a7336-22428882233mr316949475ad.1.1741730493639; 
 Tue, 11 Mar 2025 15:01:33 -0700 (PDT)
Received: from localhost ([216.228.125.130]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736ded451c1sm4125755b3a.119.2025.03.11.15.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 15:01:32 -0700 (PDT)
Date: Tue, 11 Mar 2025 18:01:30 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>,
 David Laight <david.laight.linux@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 akpm@linux-foundation.org, alistair@popple.id.au,
 andrew+netdev@lunn.ch, andrzej.hajda@intel.com,
 arend.vanspriel@broadcom.com, awalls@md.metrocast.net, bp@alien8.de,
 bpf@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
 brcm80211@lists.linux.dev, dave.hansen@linux.intel.com,
 davem@davemloft.net, dmitry.torokhov@gmail.com,
 dri-devel@lists.freedesktop.org, eajames@linux.ibm.com,
 edumazet@google.com, eleanor15x@gmail.com,
 gregkh@linuxfoundation.org, hverkuil@xs4all.nl,
 jernej.skrabec@gmail.com, jirislaby@kernel.org, jk@ozlabs.org,
 joel@jms.id.au, johannes@sipsolutions.net, jonas@kwiboo.se,
 jserv@ccns.ncku.edu.tw, kuba@kernel.org, linux-fsi@lists.ozlabs.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux@rasmusvillemoes.dk, louis.peens@corigine.com,
 maarten.lankhorst@linux.intel.com, mchehab@kernel.org,
 mingo@redhat.com, miquel.raynal@bootlin.com, mripard@kernel.org,
 neil.armstrong@linaro.org, netdev@vger.kernel.org,
 oss-drivers@corigine.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, rfoss@kernel.org,
 richard@nod.at, simona@ffwll.ch, tglx@linutronix.de,
 tzimmermann@suse.de, vigneshr@ti.com, x86@kernel.org
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
Message-ID: <Z9CyuowYsZyez36c@thinkpad>
References: <4732F6F6-1D41-4E3F-BE24-E54489BC699C@zytor.com>
 <efc2ee9d-5382-457f-b471-f3c44b81a190@citrix.com>
 <5A790652-1B22-4D13-AAC5-5D9931E90903@zytor.com>
 <20250307195310.58abff8c@pumpkin>
 <EB85C3C1-8A0D-4CB9-B501-BFEABDF3E977@zytor.com>
 <Z824SgB9Dt5zdWYc@visitorckw-System-Product-Name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z824SgB9Dt5zdWYc@visitorckw-System-Product-Name>
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

On Sun, Mar 09, 2025 at 11:48:26PM +0800, Kuan-Wei Chiu wrote:
> On Fri, Mar 07, 2025 at 12:07:02PM -0800, H. Peter Anvin wrote:
> > On March 7, 2025 11:53:10 AM PST, David Laight <david.laight.linux@gmail.com> wrote:
> > >On Fri, 07 Mar 2025 11:30:35 -0800
> > >"H. Peter Anvin" <hpa@zytor.com> wrote:
> > >
> > >> On March 7, 2025 10:49:56 AM PST, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> > >> >> (int)true most definitely is guaranteed to be 1.  
> > >> >
> > >> >That's not technically correct any more.
> > >> >
> > >> >GCC has introduced hardened bools that intentionally have bit patterns
> > >> >other than 0 and 1.
> > >> >
> > >> >https://gcc.gnu.org/gcc-14/changes.html
> > >> >
> > >> >~Andrew  
> > >> 
> > >> Bit patterns in memory maybe (not that I can see the Linux kernel using them) but
> > >> for compiler-generated conversations that's still a given, or the manager isn't C
> > >> or anything even remotely like it.
> > >> 
> > >
> > >The whole idea of 'bool' is pretty much broken by design.
> > >The underlying problem is that values other than 'true' and 'false' can
> > >always get into 'bool' variables.
> > >
> > >Once that has happened it is all fubar.
> > >
> > >Trying to sanitise a value with (say):
> > >int f(bool v)
> > >{
> > >	return (int)v & 1;
> > >}    
> > >just doesn't work (see https://www.godbolt.org/z/MEndP3q9j)
> > >
> > >I really don't see how using (say) 0xaa and 0x55 helps.
> > >What happens if the value is wrong? a trap or exception?, good luck recovering
> > >from that.
> > >
> > >	David
> > 
> > Did you just discover GIGO?
> 
> Thanks for all the suggestions.
> 
> I don't have a strong opinion on the naming or return type. I'm still a
> bit confused about whether I can assume that casting bool to int always
> results in 0 or 1.
> 
> If that's the case, since most people prefer bool over int as the
> return type and some are against introducing u1, my current plan is to
> use the following in the next version:
> 
> bool parity_odd(u64 val);
> 
> This keeps the bool return type, renames the function for better
> clarity, and avoids extra maintenance burden by having just one
> function.
> 
> If I can't assume that casting bool to int always results in 0 or 1,
> would it be acceptable to keep the return type as int?
> 
> Would this work for everyone?

Alright, it's clearly a split opinion. So what I would do myself in
such case is to look at existing code and see what people who really
need parity invent in their drivers:

                                     bool      parity_odd
static inline int parity8(u8 val)       -               -
static u8 calc_parity(u8 val)           -               -
static int odd_parity(u8 c)             -               +
static int saa711x_odd_parity           -               +
static int max3100_do_parity            -               -
static inline int parity(unsigned x)    -               -
static int bit_parity(u32 pkt)          -               -
static int oa_tc6_get_parity(u32 p)     -               -
static u32 parity32(__le32 data)        -               -
static u32 parity(u32 sample)           -               -
static int get_parity(int number,       -               -
                      int size)
static bool i2cr_check_parity32(u32 v,  +               -
                        bool parity)
static bool i2cr_check_parity64(u64 v)  +               -
static int sw_parity(__u64 t)           -               -
static bool parity(u64 value)           +               -

Now you can refer to that table say that int parity(uXX) is what
people want to see in their drivers.

Whichever interface you choose, please discuss it's pros and cons.
What bloat-o-meter says for each option? What's maintenance burden?
Perf test? Look at generated code?

I personally for a macro returning boolean, something like I
proposed at the very beginning.

Thanks,
Yury
