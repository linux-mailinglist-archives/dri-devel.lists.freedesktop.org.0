Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E84B0A571B8
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 20:30:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A804A10E0C7;
	Fri,  7 Mar 2025 19:30:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BKX/mNn2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68C9C10E0C7
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 19:30:11 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-219f8263ae0so45044415ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 11:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741375811; x=1741980611; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ujnt93n2ZnNyLSMeIXg1bvl3lYCF/JQ06NeoxLK/MdQ=;
 b=BKX/mNn2PGvbHOvyYNTlzsOGqrXVypbad0G+P9YCv5akJvcA39rdX8awxjFXiBmrxK
 vgUNkYLBO1YpgKFJnBsVNj7DLAgaCS3l1JCwlUJKC0V4rrw427Gqe060UaYD+SA2z/pJ
 fYDKUnntYY1k01i/IgzDrU6PU4JqbNb42CpgEgU2T9+pkL0poGmRF7LOXxPhY9Y+URis
 wh4JIhIcs9hAZ0FeEZLURaKy3aYc3I1SM3JIcRrqWQOY6Eb3cghg0SgtG7/+TafgP0j6
 Qt1iR7Js89zzOOvVqXajUQZbTFlqBEdE3sJNkVlOHQcesG979d+J3rz2zKNzRZG2Df8r
 dZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741375811; x=1741980611;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ujnt93n2ZnNyLSMeIXg1bvl3lYCF/JQ06NeoxLK/MdQ=;
 b=seoHGS3Y4CPjfa3z0LPf06CXNzAn5Ebc96soRdfgC9rQwZehvVO3N1eOO0O/dlNXyb
 K/Sn/urTzETeoBvyKhSEY4tNbyuIjBplwqqr56ZzT3KDVDKc46YXl0Ic74kGz0ZfRBZu
 yuW1iJffJvdicg/afABPE2l/XlxKq8u+eG8NMlaku11/cIrVB5lr7sOe1rNQhD6D0wrQ
 CegpT0wGTod6pVekjs2/uP3Ad2ZH5hwtYgi7v9e96wmM6745/nrsX0gp18mZIrcPnlGF
 ZuSW5DCNr6Xsb5YUrwgB12NcjTWPbpthU1cbKkTmf0MCKeEyEc//UsJc10P47ZRgkv+I
 JMOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCd3ES4HggHeiCP7soT6wjtnuh1KPhSeh4pVegLLE7FtqJCkSeHqgQDq09by+7nq4eRC4NnEnn9J4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwKO+2KZwSQ90fUiFngDYf554fy6CZxpHnttlNNW7Ubx8IpP7H
 5MZZSmd15N/OyE+2QwevD0uqCXYtviJTLdBNyLD6C7R2lgwWUAtA
X-Gm-Gg: ASbGncurg/ckE8BbHWIHwt2Ye23v9p3WnpCbpCtuezRV5n2yCJCX+IVjdiH2hP/FMK4
 fFO2/ptOOwBbJnzTeR2rf/i/Z7dqiJjFX76L/Ey7Mf5cf9esLcS7e34kmCNWEzT1mBexDJkZMfn
 RkLH0fdC4AiHEjX5UFhvHVEar6Z8kW04ajxA/FvtD4uuusdMhzK3R8a+f9JzwqH/WmUO9vB/pBp
 PP5OgEstbc6cK76Sbo8F6MEiCGkQ50VQFYBr7fMOyDnrJ+/5wocJ3YIG64H9aIefcJwjzS9VM7C
 BVwXGy0HQHKSfWMf7EwtwphtiPTAtLZIK6UCvp2Apy0W
X-Google-Smtp-Source: AGHT+IEmnovg8SODODeYbL7InF2WSqC9McWE/UoY4IWxbTzIc1jrQMfyhDSc++tBv5NrR3IGNpr8rQ==
X-Received: by 2002:a17:902:f645:b0:21f:4c8b:c4de with SMTP id
 d9443c01a7336-22428ac90a6mr73028235ad.42.1741375810720; 
 Fri, 07 Mar 2025 11:30:10 -0800 (PST)
Received: from localhost ([216.228.125.130]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-224109ddffesm34081415ad.40.2025.03.07.11.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 11:30:10 -0800 (PST)
Date: Fri, 7 Mar 2025 14:30:08 -0500
From: Yury Norov <yury.norov@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ingo Molnar <mingo@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
 Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
 eajames@linux.ibm.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, mchehab@kernel.org,
 awalls@md.metrocast.net, hverkuil@xs4all.nl,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 akpm@linux-foundation.org, alistair@popple.id.au,
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
Subject: Re: [PATCH v3 01/16] bitops: Change parity8() return type to bool
Message-ID: <Z8tJNt83uVBca0cj@thinkpad>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
 <20250306162541.2633025-2-visitorckw@gmail.com>
 <9d4b77da-18c5-4551-ae94-a2b9fe78489a@kernel.org>
 <Z8ra0s9uRoS35brb@gmail.com>
 <a4040c78-8765-425e-a44e-c374dfc02a9c@kernel.org>
 <Z8ri5h-nvNXNp6NB@gmail.com>
 <04AA7852-2D68-4B3F-9AA7-51AA57E3D23D@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04AA7852-2D68-4B3F-9AA7-51AA57E3D23D@zytor.com>
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

On Fri, Mar 07, 2025 at 04:14:34AM -0800, H. Peter Anvin wrote:
> On March 7, 2025 4:13:26 AM PST, Ingo Molnar <mingo@kernel.org> wrote:
> >
> >* Jiri Slaby <jirislaby@kernel.org> wrote:
> >
> >> On 07. 03. 25, 12:38, Ingo Molnar wrote:
> >> > 
> >> > * Jiri Slaby <jirislaby@kernel.org> wrote:
> >> > 
> >> > > On 06. 03. 25, 17:25, Kuan-Wei Chiu wrote:
> >> > > > Change return type to bool for better clarity. Update the kernel doc
> >> > > > comment accordingly, including fixing "@value" to "@val" and adjusting
> >> > > > examples. Also mark the function with __attribute_const__ to allow
> >> > > > potential compiler optimizations.
> >> > > > 
> >> > > > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> >> > > > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> >> > > > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> >> > > > ---
> >> > > >    include/linux/bitops.h | 10 +++++-----
> >> > > >    1 file changed, 5 insertions(+), 5 deletions(-)
> >> > > > 
> >> > > > diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> >> > > > index c1cb53cf2f0f..44e5765b8bec 100644
> >> > > > --- a/include/linux/bitops.h
> >> > > > +++ b/include/linux/bitops.h
> >> > > > @@ -231,26 +231,26 @@ static inline int get_count_order_long(unsigned long l)
> >> > > >    /**
> >> > > >     * parity8 - get the parity of an u8 value
> >> > > > - * @value: the value to be examined
> >> > > > + * @val: the value to be examined
> >> > > >     *
> >> > > >     * Determine the parity of the u8 argument.
> >> > > >     *
> >> > > >     * Returns:
> >> > > > - * 0 for even parity, 1 for odd parity
> >> > > > + * false for even parity, true for odd parity
> >> > > 
> >> > > This occurs somehow inverted to me. When something is in parity means that
> >> > > it has equal number of 1s and 0s. I.e. return true for even distribution.
> >> > > Dunno what others think? Or perhaps this should be dubbed odd_parity() when
> >> > > bool is returned? Then you'd return true for odd.
> >> > 
> >> > OTOH:
> >> > 
> >> >   - '0' is an even number and is returned for even parity,
> >> >   - '1' is an odd  number and is returned for odd  parity.
> >> 
> >> Yes, that used to make sense for me. For bool/true/false, it no longer does.
> >> But as I wrote, it might be only me...
> >
> >No strong opinion on this from me either, I'd guess existing practice 
> >with other parity functions should probably control. (If a coherent 
> >praxis exists.).
> >
> >Thanks,
> >
> >	Ingo
> 
> Instead of "bool" think of it as "bit" and it makes more sense

So, to help people thinking that way we can introduce a corresponding
type:
        typedef unsigned _BitInt(1) u1;

It already works for clang, and GCC is going to adopt it with std=c23.
We can make u1 an alias to bool for GCC for a while. If you guys like
it, I can send a patch.

For clang it prints quite a nice overflow warning:

tst.c:59:9: warning: implicit conversion from 'int' to 'u1' (aka 'unsigned _BitInt(1)') changes value from 2 to 0 [-Wconstant-conversion]
   59 |         u1 r = 2;
      |            ~   ^

Thanks,
Yury
