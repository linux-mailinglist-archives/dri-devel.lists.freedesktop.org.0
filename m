Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A584E900E71
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2024 01:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579B010E0E8;
	Fri,  7 Jun 2024 23:28:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Jm8umP5n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7A010E0E8;
 Fri,  7 Jun 2024 23:28:28 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-6dccc583e89so298431a12.1; 
 Fri, 07 Jun 2024 16:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717802907; x=1718407707; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to:from
 :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
 :reply-to; bh=FCpSnT/Z3gu96TW6Bi5jW20jSUnyH6/NiGyW/o29kp4=;
 b=Jm8umP5nj0MIgI0JNrCdyj3m65ptYxQhg36kJIqWt/XeNWJ6l3uIDYtHsAfIsWfU3N
 ccOdkAxZLTsjy5Xvcrm4C+BMmGmVoRqNpYxU8+IeoPbRo9WSZI3K2OKcYaGcIvwEgPsM
 LeTP2rStyf/yyVz3QvaLNTDZ7k5NS58ugr0bXJ+ikDOa34T4rYuii5N+txV1rT6kcQQX
 DEj6BFdwiieZJKONcN/9hzcJdp0g7fwDx3YVXG93XAoJPmWAwb/+iEObUVluFQkK13xD
 xDva6X6BzhFRuW6k3fYR/vGqEl5EHBv9QU+sxixqFneg+KzM4KBN6iULB8HBGbBmhN03
 pRRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717802907; x=1718407707;
 h=content-transfer-encoding:mime-version:references:in-reply-to:from
 :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=FCpSnT/Z3gu96TW6Bi5jW20jSUnyH6/NiGyW/o29kp4=;
 b=MJWy3utY+ZGA16KuP3GaE4BMzR3RZqGWee+trSpr6RJzK6DowIkeZWtufUuhBwZ6j6
 6UbdfkrBZ8O3Q32m/i8krEwXKAHW/SN3BWTpMXdV/+fgtFEHGjB/cAF5Qbh7sC4MOVx3
 l3jYfbsfD3m0Cyci+u+MexRhJ6T0Bc23DKuTMBBoKo3KILNS/kz17+tXHihHvd7Zt6qq
 JMPmTw7hc7CJt/d0imBGBs0WQ3zxMdr51KxLIE5M3iJeFt47Rw0eForAYD08PrwfQgCp
 TiYvuqzPZum6JaQTXsldCTysFo2GDzef9JDaEQsq84nat4GgcFzR+23BtNN2yNPvk+R9
 Q+qA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlSHsQzj0RAX+Tig5ygAQ4NfvO/lnE1qYndwD8y7HKWarzbM0hfqHT8B7jCZsoGCAsa6MtYzHGBDKELM/lxYowdT9T8FJYtHOujYOnbkA/EaVjt/1CO9yfhYJ0YDKTXy+a9r1d+gVBpmWv5NkvIg==
X-Gm-Message-State: AOJu0Yz/kxFRzkxsXZoFlQfifXR0DRbxHm3Vr5N/CTfsnJhdhctdVPn9
 8dxSpmRyZXkUG+K/4dUpkkSdeWVtAPJba6w50IDFePJfOW9F6mt+
X-Google-Smtp-Source: AGHT+IHKqP8BpJ3GvlWBCtH9BHSef3p/eg8WyNZ0fLmpTYYkVZFK8lROhnr7aPwhZgNBRJIsfeTjWA==
X-Received: by 2002:a17:903:2308:b0:1f6:ee76:1b35 with SMTP id
 d9443c01a7336-1f6ee762403mr9866665ad.5.1717802907232; 
 Fri, 07 Jun 2024 16:28:27 -0700 (PDT)
Received: from localhost (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp.
 [180.15.241.226]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f6bd75f157sm40102215ad.18.2024.06.07.16.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 16:28:26 -0700 (PDT)
Date: Sat, 08 Jun 2024 08:28:06 +0900 (JST)
Message-Id: <20240608.082806.872238171846642664.fujita.tomonori@gmail.com>
To: dakr@redhat.com
Cc: gregkh@linuxfoundation.org, fujita.tomonori@gmail.com,
 wedsonaf@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com,
 aliceryhl@google.com, lina@asahilina.net, pstanner@redhat.com,
 ajanulgu@redhat.com, lyude@redhat.com, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 mcgrof@kernel.org, russ.weight@linux.dev
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <ZmNJpQbTtFUPOkAJ@cassiopeiae>
References: <ZmMMMyi3uXTFtIae@cassiopeiae>
 <2024060745-palatable-dragging-32d1@gregkh>
 <ZmNJpQbTtFUPOkAJ@cassiopeiae>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
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

On Fri, 7 Jun 2024 19:55:49 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

> On Fri, Jun 07, 2024 at 05:41:11PM +0200, Greg KH wrote:
>> On Fri, Jun 07, 2024 at 03:33:39PM +0200, Danilo Krummrich wrote:
>> > On Fri, Jun 07, 2024 at 02:36:50PM +0200, Greg KH wrote:
>> > > Anyway, that's all hand-wavy right now, sorry, to get back to the point
>> > > here, again, let's take this, which will allow the firmware bindings to
>> > > be resubmitted and hopefully accepted, and we can move forward from
>> > > there to "real" things like a USB or PCI or even platform device and
>> > > driver binding stuff.
>> > 
>> > In order to continue I propose to send out the following series:
>> > 
>> > 1) minimal device and firmware abstractions only
>> 
>> Sounds good.
> 
> Just a heads-up, I'll probably send this one quite a bit earlier than the other
> two to make sure to unblock Fujita on their PHY driver.

Please. The sooner, the better. I need to send the PHY driver with
these patchse to netdev.

I'm not sure what the above "minimal device" means. If you send the
original patch again instead of the patch that Greg already approved
and the discussion continues, then I proceed with the approved patch.
