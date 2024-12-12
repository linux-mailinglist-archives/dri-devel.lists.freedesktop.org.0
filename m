Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A489EE39D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 11:04:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E55DC10E2F5;
	Thu, 12 Dec 2024 10:04:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="kUU3OUX4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F3DE10E2F5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 10:04:03 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-434ab938e37so2740575e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 02:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1733997842; x=1734602642; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y189+FYL3S0sHeJXa1RbUedOKNtwkrgPlP3+sKk2eYY=;
 b=kUU3OUX4mNfMpZIsIrK1saVzjfXOnR+3QH+/Mo6r6O6DZ94sIP+4yVZQ1wWRrU7mt/
 ANQpW4ZHWDVyE+9wSevyFD1spKusVJOMHgWW8zPMehXxr42ziRcudkrQodWTy5ODtUG4
 4MX27aaV6x/rDKgkt9JWbHDCk78ijp4yXCMqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733997842; x=1734602642;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y189+FYL3S0sHeJXa1RbUedOKNtwkrgPlP3+sKk2eYY=;
 b=ZTd0uyafBJ9xauEKCQZq5hGibTapkV2rFuY0bFFCuX3O432FgzZG3MsgibjBKW6Zki
 w7dGOei19b/DFKI1w1Ff29z7TCEOdzo3pXUwBXc6sRDk124swBvH6wBqTGLNViegZ+ko
 yXaxa90YU5NYV+xb6VyXjdQ0vccJ+h/ulH8bGDIh+DbedJOsAO7EFTDaut6F2XDlULFS
 KIaPw5ZSumtPPPZvSLVePQRGYbzRo5OIH9BWyQI7fBboGdXMXoy40hLq4Nzet3he9U4C
 rvU9uWE1DAh9Pjm/Em/gTZGwRiDBYP+KqUE1c809bczL0TDx0bhBNa0jQZc7x//mRwPj
 mjIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrOVYlCkFY/IeYt3wadVRWSlLAm760bBatYsZFdajf30qMmWmpcCi1RCfpNFbMXnoGIVeRPbJQMhs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/e6s7f0sngJjmFBkDu+4Myc94cM5Nop7rcgszieT3RW2gz2/e
 sN2pyvMlrUBOw3L5nkpbUBha/yLCzr6Z7vLPT0IwYGD+T+KmSc6PBuXbw7045EQ=
X-Gm-Gg: ASbGncv0A6Ed1AI2sQoiPcRhm3UfKvzcl44XgIpjls048VuTwKVQPMhGRsyUcfRr7l/
 15fK1cGmgOkxGnM5jnCx7sScdeC1fzmzVfLovbNbOQ/ubpUsbJuUapT5s0BsBTgCVYxsAp/lo0R
 D8VL1LFVMJpsJsmKW+gy95/kiQhq4gMoWeZGU7rq4doQv2bLKb/qyeDtBTDZtlolLMHOXb273Oe
 Y193wXlT/ckUdzoTa6H/Z6kcj5n17Lp2DV3Y2Ak3RVHCrkOwia92zehda/fuNbfEjtP
X-Google-Smtp-Source: AGHT+IHVDFCV8qTqG4FJzegIMjR3/fJ7gxNzTodnB/J4AH0Rh+ZJjWS7hvQCEnQpfy2gIJPzhvI2Bg==
X-Received: by 2002:a5d:6c65:0:b0:385:e013:39ec with SMTP id
 ffacd0b85a97d-3864ce89848mr5209003f8f.8.1733997841396; 
 Thu, 12 Dec 2024 02:04:01 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-387824bf0d8sm3580473f8f.48.2024.12.12.02.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 02:04:00 -0800 (PST)
Date: Thu, 12 Dec 2024 11:03:58 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Lyude Paul <lyude@redhat.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Asahi Lina <lina@asahilina.net>, Danilo Krummrich <dakr@kernel.org>,
 mcanal@igalia.com, airlied@redhat.com, zhiw@nvidia.com,
 cjia@nvidia.com, jhubbard@nvidia.com, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [WIP RFC v2 05/35] rust: drm/kms: Add bindings for drm_connector
Message-ID: <Z1q1DtxI9AlNBiJ6@phenom.ffwll.local>
Mail-Followup-To: Lyude Paul <lyude@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Asahi Lina <lina@asahilina.net>, Danilo Krummrich <dakr@kernel.org>,
 mcanal@igalia.com, airlied@redhat.com, zhiw@nvidia.com,
 cjia@nvidia.com, jhubbard@nvidia.com,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 open list <linux-kernel@vger.kernel.org>
References: <20240930233257.1189730-1-lyude@redhat.com>
 <20240930233257.1189730-6-lyude@redhat.com>
 <02A84CFD-BE91-40E6-995C-4E81A8DAB92C@collabora.com>
 <7b57940a3987532963ce5fbd3a999665c17611ab.camel@redhat.com>
 <Z1lQnhKmH39C7Erl@phenom.ffwll.local>
 <f648903a13d204a9a96e942edbead3173c5badc7.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f648903a13d204a9a96e942edbead3173c5badc7.camel@redhat.com>
X-Operating-System: Linux phenom 6.11.6-amd64 
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

On Wed, Dec 11, 2024 at 07:34:10PM -0500, Lyude Paul wrote:
> On Wed, 2024-12-11 at 09:43 +0100, Simona Vetter wrote:
> > On Tue, Dec 10, 2024 at 06:41:52PM -0500, Lyude Paul wrote:
> > > On Tue, 2024-11-26 at 18:25 -0300, Daniel Almeida wrote:
> > > > Hi Lyude,
> > > > 
> > > > > On 30 Sep 2024, at 20:09, Lyude Paul <lyude@redhat.com> wrote:
> > > > > 
> > > > > +
> > > > > +impl<T: DriverConnector> Connector<T> {
> > > > > +    /// Construct a new [`Connector`].
> > > > > +    ///
> > > > > +    /// A driver may use this to create new [`Connector`] objects.
> > > > > +    ///
> > > > > +    /// TODO: Add a way to handle creating connectors after device registration. Also, that's why we
> > > > > +    /// don't ask for a UnregisteredKms device here.
> > > > 
> > > > Can you elaborate? We can try to help if you describe this a bit better :)
> > > 
> > > oh - totally forgot to respond to this!
> > > 
> > > So: out of all of the mode objects, Connectors are a bit special. They can
> > > actually be created and destroyed after registration (hence why they have a
> > > refcount). This is not terribly difficult to handle before registration, the
> > > complication comes after registration - where we'll likely need to split
> > > Connector into two different types:
> > > 
> > > UnregisteredConnector
> > > 
> > > Connector
> > > 
> > > Where you have to sacrifice the UnregisteredConnector to get to the Connector
> > > object. I don't think this will actually be too difficult to implement, I just
> > > didn't get around to it yet because there were so many other open questions I
> > > had about the design here in general.
> > 
> > For connnnector lifetime fun please also see Imre's patches for fixing
> > some races around mst hotplug. At least on the C side I think we will
> > split connectors into dynamic and static ones, to be able to handle things
> > correctly. It's a bit a mess unfortuantely.
> 
> Thanks for letting me know! Honestly I think this actually should make things
> easier to handle in rust, since I can just push off dynamic connectors for the
> time being and simplify things a bit.

Yeah it definitely clarifies the lifetime rules on the C side, which tends
to help Rust a lot since yolo lifetime is just not a real option for rust
bindings.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
