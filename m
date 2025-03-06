Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C1AA55522
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 19:35:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5736510E2C2;
	Thu,  6 Mar 2025 18:35:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D0310E998
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 14:04:37 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-549880cdb1fso790457e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 06:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741269875; x=1741874675; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9w1loW1D93ByGjxUH+v0w87cRUrgY5imRrAfL3a+uhQ=;
 b=R3ktEmzNptwmls/vj6f3dQHVZoBmj4J8rKMd7xM/SVgxzscZnRxTJBbb1KjZdF3HCF
 v3pVaRaBeGanpd8WIa9doEY0K0GM4pxfOHP897IHu+RlaRn3oktsKhevEifv2wHrzQIS
 /EnhnjopLRPftum5qLV7hsTLGSLcEtcLQ6r9tEqiPjkCkeM5i/P6CLtIVfIIdT2KDPxX
 275yUfiTLg2TaMt7p67fHZR7soiMsHyr2FJD7v8iYTIhbhlm5aIZPPvhv40VkikKpNeR
 zX9ViQp7DUeep5N8vorVm6ju4Hnnfhp31/t3LpVNvDGdxsJ9hrfr2ahE9Qjl+uTWK2zc
 rT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741269875; x=1741874675;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9w1loW1D93ByGjxUH+v0w87cRUrgY5imRrAfL3a+uhQ=;
 b=gFFF+7kiprXL/Igyff0siZfLndSfMmKN8Mu8aVPw7/O4KQwQLV1Xt1+GsPylsqPfLe
 vp7Gaf7X/78F5fbpnLvIaTseFH6qOu8wteQrCKoaxc2L+KIfxTJ+HuH0JMW6y4fthV7Z
 zu71H5DS3wmfATwmk0M/pn3QvUkgKV2iVDXz7gpDafTJEKgLIR1pB5t/SbjPtNzfLqrz
 baqfFedCQO8mPmxlCLa0gbQSwYxANGlioZ9C0wazISax+7eA+0S7zN9rQvGRUfn8MWdC
 FDXgHgw2p9zl0DOTyqm6kp6r5JslPI4iHa5ijuZlOMeXZoseP0ZzjUakPIR32UwPiqn5
 wFsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfQe1aa6jo1AEXAf8Ui64ud4EFawTzWp0XqyjPJfjB4of7nHYzFmQCNfvKTKnW8EFTncHJgX6fAmQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOzdzczAfWs7W5y4bfNX0RlbymtIbZTMMVUnWcWl72Tx9eNENf
 zuYpHusKmqm7LDaHaK6/mO5rp1VWkXeX8uab9Exh8xbehq8+xMRu
X-Gm-Gg: ASbGncupzjQ+aDK/1snAoQq8uvErVU0IC7ddCHE1PrIxuxtRMp3am9PXyPuFSDx2Jtx
 aoJHzaWp4U8CAyYO/RRN0ggkMjOLm1u2tviNyM8MgfSIJkTKAowKyV3+zIH2WvlZVE37iGmJcyP
 YYq/QRzRQyK/G7wybMWL0e0E3jhJ4ivIgY1SHi9pWTM63BCpoyg/JgY16H+E5nIxpSHu8RPQdkV
 fCO+EDtSyjJvvezqYKFPc9gTZAY9M51LBMF7N+m+B+tNq1cJxAPpG2MeELuOiCFSJnNo5tGwM12
 H9EFjsFi0vwOlL0zu4Lf3Zq412Q6HzOYU2S38Rotbdg2ndQg1iBfEvnX7mbYVKMzyTY=
X-Google-Smtp-Source: AGHT+IGonnW2BIlqC2FdXER3bXAFv4ISuWErmmFhIv+nnElrcZtI1jJxe9rCZw7FGgE21qslHhMlvg==
X-Received: by 2002:a05:6512:281d:b0:549:5b54:2c66 with SMTP id
 2adb3069b0e04-5497d345ea7mr2751359e87.23.1741269875014; 
 Thu, 06 Mar 2025 06:04:35 -0800 (PST)
Received: from pc636 (host-95-203-6-24.mobileonline.telia.com. [95.203.6.24])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498b0bcf82sm185064e87.154.2025.03.06.06.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 06:04:34 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Thu, 6 Mar 2025 15:04:31 +0100
To: Jocelyn Falempe <jfalempe@redhat.com>, Matthew Wilcox <willy@infradead.org>
Cc: Matthew Wilcox <willy@infradead.org>,
 Ryosuke Yasuoka <ryasuoka@redhat.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 kraxel@redhat.com, gurchetansingh@chromium.org, olvaffe@gmail.com,
 akpm@linux-foundation.org, urezki@gmail.com, hch@infradead.org,
 dmitry.osipenko@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 linux-mm@kvack.org
Subject: Re: [PATCH drm-next 1/2] vmalloc: Add atomic_vmap
Message-ID: <Z8mrb_zcou6Hn7hF@pc636>
References: <20250305152555.318159-1-ryasuoka@redhat.com>
 <20250305152555.318159-2-ryasuoka@redhat.com>
 <Z8kp9Z9VgTpQmV9d@casper.infradead.org>
 <3bfd4238-6954-41a3-a5a3-8515a3ac9dce@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bfd4238-6954-41a3-a5a3-8515a3ac9dce@redhat.com>
X-Mailman-Approved-At: Thu, 06 Mar 2025 18:35:34 +0000
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

On Thu, Mar 06, 2025 at 02:24:51PM +0100, Jocelyn Falempe wrote:
> On 06/03/2025 05:52, Matthew Wilcox wrote:
> > On Thu, Mar 06, 2025 at 12:25:53AM +0900, Ryosuke Yasuoka wrote:
> > > Some drivers can use vmap in drm_panic, however, vmap is sleepable and
> > > takes locks. Since drm_panic will vmap in panic handler, atomic_vmap
> > > requests pages with GFP_ATOMIC and maps KVA without locks and sleep.
> > 
> > In addition to the implicit GFP_KERNEL allocations Vlad mentioned, how
> > is this supposed to work?
> > 
> > > +	vn = addr_to_node(va->va_start);
> > > +
> > > +	insert_vmap_area(va, &vn->busy.root, &vn->busy.head);
> > 
> > If someone else is holding the vn->busy.lock because they're modifying the
> > busy tree, you'll corrupt the tree.  You can't just say "I can't take a
> > lock here, so I won't bother".  You need to figure out how to do something
> > safe without taking the lock.  For example, you could preallocate the
> > page tables and reserve a vmap area when the driver loads that would
> > then be usable for the panic situation.  I don't know that we have APIs
> > to let you do that today, but it's something that could be added.
> > 
> Regarding the lock, it should be possible to use the trylock() variant, and
> fail if the lock is already taken. (In the panic handler, only 1 CPU remain
> active, so it's unlikely the lock would be released anyway).
> 
> If we need to pre-allocate the page table and reserve the vmap area, maybe
> it would be easier to just always vmap() the primary framebuffer, so it can
> be used in the panic handler?
> 
We can reserve a vmap space for ATOMIC or NOWAIT allocations. As for PTE
part, we can also populate reserved space, because after that operation
those are never get released.

The question is how many users need this. As for this particular case i
am in line with Jocelyn Falempe. Allocate for DRM and write on panic.

--
Uladzislau Rezki
