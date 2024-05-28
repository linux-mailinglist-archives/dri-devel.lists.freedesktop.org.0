Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA63C8D1C83
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 15:18:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD5110E241;
	Tue, 28 May 2024 13:18:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UVS3ebLq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5645A10E0E7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 13:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716902276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lXhZ4GwLcoi2UfjZqW+CqubaUGEnLtPdVEK+h8tMm30=;
 b=UVS3ebLq5pz4hE50uihTCs0b60+u0l2JJKXIMnBB3t1z5EeWEhn/raTmYNKZvTBEmZIIaq
 azIwbhkoowSDOEhbN007YyY+MZ2UAfSDcXO6sdp+qvuoxByKzqTKBAuea+if43168Mrs85
 j4J1FCSXX5fHYZv6iDIKWsCiuS+7Aos=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-zWMGCk-9NfOdMsmGN0Fm3g-1; Tue, 28 May 2024 09:17:54 -0400
X-MC-Unique: zWMGCk-9NfOdMsmGN0Fm3g-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42120612621so3702735e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 06:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716902273; x=1717507073;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lXhZ4GwLcoi2UfjZqW+CqubaUGEnLtPdVEK+h8tMm30=;
 b=DRdgfcLReuQWciqoYwv9XuQEXQpqM7CK3TgLAVrZokSXJUHwGtkKDR2B42WT0RH5JM
 YpA7X+mDVb7Fr+fEBCGA1IBQfhCnR9Ky2AwIZqaV3nGtKH913hkdPyCmtpIj7GCIgHgx
 dD0Q3otAat06hb3I4wZBcs3UFV0AR8wMdXXH+VFhW5uiJ1r4/bNqdiV8/KtUAmXJbaEc
 lGRP5UhavEFTJ4SRQOHreH3rEbOpLr9JAZJWWOZbuAXQt9h364kmNEHSR2xVTCSsp70y
 KlG7eC47UTmsleQOaJQ0AobgTHb5kHOStxSMSsGIKdUihvbw2c4RjNXgqR5dNXE7AQdS
 pZag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWw3/q+zlJo4WEPnVhSueJgohnts8Z+1MyjUh6K0nX6L+4Gxae3qGd9cMEraFEQJfbv+GBRdsbgt6EP2CGTHf/81VafBK5eHzKhg4/vHQKA
X-Gm-Message-State: AOJu0YzCCWtNTdGZpve/4VJJVYN52AKvnVVpN1P1hrvr7sd/fVi6GfE9
 yLIFN+4zp49bjQdrmQvmYIr9SSDDi0eWC1cDJvhgwVdt+9R5J21DaT1caQycHnVBplb3zr3Y/dy
 S6p3fZbT6BLsXjvs+LubORbhznrI+UT9jwhei8QEPWfbrx/DpVeKg9kvPCkkZ99EiRA==
X-Received: by 2002:a05:600c:444e:b0:420:14fb:de1f with SMTP id
 5b1f17b1804b1-42108a5965fmr80598505e9.14.1716902273649; 
 Tue, 28 May 2024 06:17:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeoUSYJdlcKYm+2Dyn96J9Jaogyqz0LroLG0mk080drd07yOfZ4belYxCkfOPHgHjsh1EdZQ==
X-Received: by 2002:a05:600c:444e:b0:420:14fb:de1f with SMTP id
 5b1f17b1804b1-42108a5965fmr80598225e9.14.1716902273213; 
 Tue, 28 May 2024 06:17:53 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42100f1410csm174063405e9.15.2024.05.28.06.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 06:17:52 -0700 (PDT)
Date: Tue, 28 May 2024 15:17:50 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@samsung.com,
 aliceryhl@google.com, lina@asahilina.net, pstanner@redhat.com,
 ajanulgu@redhat.com, lyude@redhat.com,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, mcgrof@kernel.org, russ.weight@linux.dev
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
Message-ID: <ZlXZfgdZkBveaUJ1@pollux>
References: <20240520172422.181763-4-dakr@redhat.com>
 <20240522.085334.1009573112046880609.fujita.tomonori@gmail.com>
 <ZlTdh/eQAIhxNn9e@pollux.localdomain>
 <20240528.200126.99248529380429957.fujita.tomonori@gmail.com>
 <ZlXLzCYiwdMxic3X@pollux>
 <2024052816-makeshift-irrigate-cef5@gregkh>
MIME-Version: 1.0
In-Reply-To: <2024052816-makeshift-irrigate-cef5@gregkh>
X-Mimecast-Spam-Score: 0
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

On Tue, May 28, 2024 at 02:45:02PM +0200, Greg KH wrote:
> On Tue, May 28, 2024 at 02:19:24PM +0200, Danilo Krummrich wrote:
> > However, if you have a driver that needs the firmware abstractions, I would be
> > surprised if there were any hesitations to already merge the minimum device
> > abstractions [1] and this one (once reviewed) without the rest. At least there
> > aren't any from my side.
> > 
> > [1] https://lore.kernel.org/rust-for-linux/20240520172554.182094-2-dakr@redhat.com/
> 
> No, the device abstractions are NOT ready for merging just yet, sorry,
> if for no other reason than a non-RFC has never been posted :)

I did not say they are ready. I said that I'd be surprised if we couldn't merge
[1] once it is ready even without the rest being ready. :)

> 
> greg k-h
> 

