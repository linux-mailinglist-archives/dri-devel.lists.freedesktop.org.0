Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C56B0A5857D
	for <lists+dri-devel@lfdr.de>; Sun,  9 Mar 2025 16:48:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E130110E1C6;
	Sun,  9 Mar 2025 15:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gv1luz1T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0130910E1C6
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Mar 2025 15:48:36 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2254e0b4b79so22453545ad.2
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Mar 2025 08:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741535316; x=1742140116; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DgWYE3yJh/lyMxOG1Kh3pm47EvZJ8tal8TpSNO72h98=;
 b=gv1luz1ThSceKCiwp4c1h/6Wc5DwtnwdsAZqdZAbOrduNp/YeewAgbc4b05PzPKmk0
 p9A88ApxLNNyXxU13tp/u0F148PEHCCERIp8U7ar6zdfRNImUUxfVKaDxvEeRE5/mYWG
 flWVZ5cJ1KvV7HzY3sFtp9abmHEXXIUBwyfQ1opVWiYc16OJd2DUpvKHURJ5Z8rs72fK
 Kb06c/kpmH9KDx/p46W/pI8ixS7dVt8e7qI6dx2eLtUpzJ3yAgBlNaKul5gdeZcNofPr
 w5jBFtobWgmA/E4Y78eLwBmFlnhZLNuY5iiKfjwbllmbIezK8amFprvTl9Y9dFpG+BwB
 XDkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741535316; x=1742140116;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DgWYE3yJh/lyMxOG1Kh3pm47EvZJ8tal8TpSNO72h98=;
 b=AejvNddojF2SSItevCeHZHXxwZSYpkzs8qcyHFL00LgeaXNWznPmkCkxrNoTUWRPaJ
 nVR/8YMliEnM08JEoKjhbJ6SP1WxPpBHd37U5oWSHqdQry3YgbzxNkyh+cH+8UGZ0tac
 YbLK76QZWRzzNVfxX7hiagSHI2T/FwTI1uuHdU9Sy/+YfNhDFAamenkP47zeSVk0czPg
 0XcA2/hRciawBDaPkmhzGK43uDL/gDUr+X6qlE9qzAFWyQeXkZ5D0fl3mGJGLKEugcGa
 6gDYqumI+mYktqa0ffErxNsIEo7PzEiWnzcCzH0ivK2791EH1LD8G73a1opV5TJNEq24
 qNAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgBer+Un698xUXaIMxcRO/bkBd3Mw5pisNULRM0sTOoElORCuAUJ7dQVGaIGb2kD2RkHlK+GbRNS4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3lpARiF72GIN8He3uu+W33mquzjAIQkvAE5sybnf7pwgco5Kl
 oQ61rQqaEDiCQ7jE6lzhu5nqya67szG/XVnQjLo+10RqFvwnUnJr
X-Gm-Gg: ASbGncv1uRGuPnldE8dymuyzvm4hRbfyQ4Jrhy4favPkhIF4NqLz2/A3Aicymn3XA9I
 NcIQRaPmOxvqsQuqQrxK7Jh26ljr4ZLJbLvWt2DTCdsezRzLGJYvB3DrpXT8BcI/EOUkAaIREJu
 D/lV2ui0a1+GQhxGm1IbLB2Py4JV1s1eB9n2DOpNTuGjQpMIUwXQhkNPHHz949NHnOWwjs5etU3
 QHunoEp4ojUAUl5RoRmcTWD1/UUbidwTGa25DFqJMzRbRYBtgCZ8CM6Ga+fAhgfdVdSypNg3oZo
 CRAUfSoCDvJRV2de6NyMtW7ZBQUfFM9g/EVoDkIGwzkNx8aV0PMLZgRwDInkCaXB34/bVcjc
X-Google-Smtp-Source: AGHT+IEkPjdlZsP28acQWQx0Qye7i9usm3kNOW0i6DfYwW0Xas+u0oor8hXm2eg176ewgjMSRnRBqg==
X-Received: by 2002:a05:6a20:4328:b0:1f3:4661:d19e with SMTP id
 adf61e73a8af0-1f544acd6ffmr16482561637.9.1741535316400; 
 Sun, 09 Mar 2025 08:48:36 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af2894e3cdasm5384249a12.24.2025.03.09.08.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 08:48:35 -0700 (PDT)
Date: Sun, 9 Mar 2025 23:48:26 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: David Laight <david.laight.linux@gmail.com>,
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
 tzimmermann@suse.de, vigneshr@ti.com, x86@kernel.org, yury.norov@gmail.com
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
Message-ID: <Z824SgB9Dt5zdWYc@visitorckw-System-Product-Name>
References: <4732F6F6-1D41-4E3F-BE24-E54489BC699C@zytor.com>
 <efc2ee9d-5382-457f-b471-f3c44b81a190@citrix.com>
 <5A790652-1B22-4D13-AAC5-5D9931E90903@zytor.com>
 <20250307195310.58abff8c@pumpkin>
 <EB85C3C1-8A0D-4CB9-B501-BFEABDF3E977@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <EB85C3C1-8A0D-4CB9-B501-BFEABDF3E977@zytor.com>
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

On Fri, Mar 07, 2025 at 12:07:02PM -0800, H. Peter Anvin wrote:
> On March 7, 2025 11:53:10 AM PST, David Laight <david.laight.linux@gmail.com> wrote:
> >On Fri, 07 Mar 2025 11:30:35 -0800
> >"H. Peter Anvin" <hpa@zytor.com> wrote:
> >
> >> On March 7, 2025 10:49:56 AM PST, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> >> >> (int)true most definitely is guaranteed to be 1.  
> >> >
> >> >That's not technically correct any more.
> >> >
> >> >GCC has introduced hardened bools that intentionally have bit patterns
> >> >other than 0 and 1.
> >> >
> >> >https://gcc.gnu.org/gcc-14/changes.html
> >> >
> >> >~Andrew  
> >> 
> >> Bit patterns in memory maybe (not that I can see the Linux kernel using them) but
> >> for compiler-generated conversations that's still a given, or the manager isn't C
> >> or anything even remotely like it.
> >> 
> >
> >The whole idea of 'bool' is pretty much broken by design.
> >The underlying problem is that values other than 'true' and 'false' can
> >always get into 'bool' variables.
> >
> >Once that has happened it is all fubar.
> >
> >Trying to sanitise a value with (say):
> >int f(bool v)
> >{
> >	return (int)v & 1;
> >}    
> >just doesn't work (see https://www.godbolt.org/z/MEndP3q9j)
> >
> >I really don't see how using (say) 0xaa and 0x55 helps.
> >What happens if the value is wrong? a trap or exception?, good luck recovering
> >from that.
> >
> >	David
> 
> Did you just discover GIGO?

Thanks for all the suggestions.

I don't have a strong opinion on the naming or return type. I'm still a
bit confused about whether I can assume that casting bool to int always
results in 0 or 1.

If that's the case, since most people prefer bool over int as the
return type and some are against introducing u1, my current plan is to
use the following in the next version:

bool parity_odd(u64 val);

This keeps the bool return type, renames the function for better
clarity, and avoids extra maintenance burden by having just one
function.

If I can't assume that casting bool to int always results in 0 or 1,
would it be acceptable to keep the return type as int?

Would this work for everyone?

Regards,
Kuan-Wei
