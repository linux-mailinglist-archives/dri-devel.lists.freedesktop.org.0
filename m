Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB08BABE622
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 23:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4161110E626;
	Tue, 20 May 2025 21:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bNxUONXB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4675610E0C5;
 Tue, 20 May 2025 21:32:31 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-ad564b7aea9so560171866b.1; 
 Tue, 20 May 2025 14:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747776750; x=1748381550; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PVyeTtgp442HJDMgT08Hm8NeOQ55yWX3pvKDV8NYv8M=;
 b=bNxUONXB2VNC/Y4aqP/eHeZdmvo1qb1AhfgipDlG73YeDUm7EBbdiie/L3mnZ8CpNO
 wUjK+FB5gZw9TWfSHuNu1I92L9pFS04uquZBLweLlaGHeSIkVYvzU6VK0s14EQw2Oa8g
 PvmkgdCnfMiiNRRO11oj2K8OKQLBFBqh2+9PygSDrY6oVKnMVE9iez07ecGBaYkpq/fz
 GCxP5WJx36MaqbxfsAvdqDIbyiy8O610nX7ovWXLB+fLK1aZcXqIHsf2/I/Nor6mdsSe
 fRPzZitNz5V1JvE4psffryxIMQKx6hSLPRloCaX8EU8wYc7p7ZkMZdF8dJn/xn61pP4N
 oUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747776750; x=1748381550;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PVyeTtgp442HJDMgT08Hm8NeOQ55yWX3pvKDV8NYv8M=;
 b=keFGNkRydEUsIYehenm3Dq55zUnX9jl9l1c3gERev8px5yEyPxWR27L5CKil/DBCCE
 Cs6jpO9+ENV/Llb+AHbZJ4qwZ/fQy47OpGipnwe2hLfoFrhOPedaocxbosgNMLQZ7As3
 ooVFMRs82TA6eOnz86mI6snxh8mmWz4lq8Hqc0LEuQyaBcW2loGyEIlrsG27fxNGesXJ
 s3OHPZodG1k+JcdY9L2omLYLq7jiTEbiDnxHjUGB0NDihdTGhhJRB4oyFFNhCrKEpZIb
 GVrpILCGZI6s6G/lGaCGhtKGys5b8xM0VZH6owRPE4XXT6iIH/SPyrxfejoEY3dAObka
 J+gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/tSa4xEcZfPZKS2p0erfqpJKF2PJGsJWxl9hj1TnzQMoVqJqCNoiK+8ozQlO1TanfxxBHGbzb/w==@lists.freedesktop.org,
 AJvYcCX0zlBc9f5ZzBKom+JELtQO7+CkORRsCt1FxOeYITzTbi4n9TEYTzf7ajXcVVK8i+c56joi6Ce4J7I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKFJVMc1sBtD7UQpF5yD8QnL4i1tXW+LTHa6IOFng2d7SxrtyP
 436fVRP1Di5a8uasoHtSc7FlP+JxDkS4HSG/0cL4UNKfUsiZfPRCgDe8vmmfdVNlg5K9WDf8bj6
 IKvTQS0InaQzGXo3+IKpES3aZp+lqzsA=
X-Gm-Gg: ASbGncv2ItjIDaWW0TBeD2cxonYwoAi2p61qOPm1eLguST/jXzA9yVE+Fbc8CK5c2a8
 k3oR32CVMgWvjtUN7dsC+G0WPxNSSAWB3O82BZat3aI5fo8Il/idO0BvZ9uYJU4a84VaY0kH7nC
 bcZz4qIU5MJInEFgyZPrmtuZ1c8oG/5+I=
X-Google-Smtp-Source: AGHT+IE6ZfjH0fXFNg73kcmkQydRGkPJxZXm2rI85X7IwGpF2mp4Nj2W8aK6jolZcs3JZ0Fq7YjChtSqklpPuK2uKKY=
X-Received: by 2002:a17:906:4ad8:b0:ad5:46a8:1ca4 with SMTP id
 a640c23a62f3a-ad546a82c11mr1220923766b.7.1747776749497; Tue, 20 May 2025
 14:32:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
 <20250507-nova-frts-v3-16-fcb02749754d@nvidia.com> <aCN_PIYEEzs73AqT@pollux>
 <4fee85be-a8c5-4a99-8397-c93e79d72d15@nvidia.com>
 <aCxLyxcERNHKzfvI@cassiopeiae>
 <3cfb7a8c-467e-44d0-9874-361f719748b8@nvidia.com>
 <aCyZPUaPSks_DhTn@cassiopeiae>
 <bdb290d4-b369-4b8e-b78d-8c8d3cc07057@nvidia.com>
 <aCyhkiBTXV86P_GF@cassiopeiae>
 <dcd249d6-7e99-476e-b216-8ca9e1a936e5@nvidia.com>
In-Reply-To: <dcd249d6-7e99-476e-b216-8ca9e1a936e5@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 21 May 2025 07:32:17 +1000
X-Gm-Features: AX0GCFtnnWOjvTVc4bevf2USIhVR5JOAj-n3PIwluhf2VOt5T6BTyJ01ydh9IxA
Message-ID: <CAPM=9typcavVsj-w_4zaBkU=eo-hsOagHn4cMekCsXPHwLK3Aw@mail.gmail.com>
Subject: Re: [PATCH v3 16/19] nova-core: Add support for VBIOS ucode
 extraction for boot
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>, John Hubbard <jhubbard@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, 
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Shirish Baskaran <sbaskaran@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 21 May 2025 at 04:13, Joel Fernandes <joelagnelf@nvidia.com> wrote:
>
>
>
> On 5/20/2025 11:36 AM, Danilo Krummrich wrote:
> >>> If you want a helper type with Options while parsing that's totally fine, but
> >>> the final result can clearly be without Options. For instance:
> >>>
> >>>     struct Data {
> >>>        image: KVec<u8>,
> >>>     }
> >>>
> >>>     impl Data {
> >>>        fn new() -> Result<Self> {
> >>>           let parser = DataParser::new();
> >>>
> >>>           Self { image: parser.parse()? }
> >>>        }
> >>>
> >>>        fn load_image(&self) {
> >>>           ...
> >>>        }
> >>>     }
> >>>
> >>>     struct DataParser {
> >>>        // Only some images have a checksum.
> >>>        checksum: Option<u64>,
> >>>        // Some images have an extra offset.
> >>>        offset: Option<u64>,
> >>>        // Some images need to be patched.
> >>>        patch: Option<KVec<u8>>,
> >>>        image: KVec<u8>,
> >>>     }
> >>>
> >>>     impl DataParser {
> >>>        fn new() -> Self {
> >>>           Self {
> >>>              checksum: None,
> >>>              offset: None,
> >>>              patch: None,
> >>>              bytes: KVec::new(),
> >>>           }
> >>>        }
> >>>
> >>>        fn parse(self) -> Result<KVec<u8>> {
> >>>           // Fetch all the required data.
> >>>           self.fetch_checksum()?;
> >>>           self.fetch_offset()?;
> >>>           self.fetch_patch()?;
> >>>           self.fetch_byes()?;
> >>>
> >>>           // Doesn't do anything if `checksum == None`.
> >>>           self.validate_checksum()?;
> >>>
> >>>           // Doesn't do anything if `offset == None`.
> >>>           self.apply_offset()?;
> >>>
> >>>           // Doesn't do anything if `patch == None`.
> >>>           self.apply_patch()?;
> >>>
> >>>           // Return the final image.
> >>>           self.image
> >>>        }
> >>>     }
> >>>
> >>> I think the pattern here is the same, but in this example you keep working with
> >>> the DataParser, instead of a new instance of Data.
> >> I think this would be a fundamental rewrite of the patch. I am Ok with looking
> >> into it as a future item, but right now I am not sure if it justifies not using
> >> Option for these few. There's a lot of immediate work we have to do for boot,
> >> lets please not block the patch on just this if that's Ok with you. If you want,
> >> I could add a TODO here.
> >
> > Honestly, I don't think it'd be too bad to fix this up. It's "just" a bit of
> > juggling fields and moving code around. The actual code should not change much.
> >
> > Having Option<T> where the corresponding value T isn't actually optional is
> > extremely confusing and makes it hard for everyone, but especially new
> > contributors, to understand the code and can easily trick people into taking
> > wrong assumptions.
> >
> > Making the code reasonably accessible for (new) contributors is one of the
> > objectives of nova and one of the learnings from nouveau.

I just want to back Danilo up on this concept as well.

When I did the experiments code, I faced the not fully constructed
object problem a lot, and I tried to resist the C pattern of Option<>
all the things, it's a very C based thing where we create an object
then initialise it as we go, and it's not a great pattern to have for
rust code.

I'm not a huge fan of constructor/builder objects either if they can
be avoided, please do, and I tried to also avoid proliferating them,
but I think for most things we can build the pieces and then the final
object as we go, it just requires doing so from the start, and not
giving into the Option<> pattern.

Dave.
