Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3FAA850BB
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 02:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C410410E1E2;
	Fri, 11 Apr 2025 00:43:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CrD8VvXY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D691010E1E2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 00:43:22 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-ac28e66c0e1so221221366b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 17:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744332201; x=1744937001; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uyi373n95XP5WRfAJ6QpuXEns7JeJsRyt8nfx137BbQ=;
 b=CrD8VvXYnBSzmxtKgYkTFoxy78ioTkYpl8CYA9uT/ZezmpNa+rmOiM5MLqk6aTi+t1
 rdTAvpaQ1DViHk3DhDGMLk7b9QOLPLae3crwXfQ6napJMWybjRZGnMc1aueiDJ/R1cL1
 9SVEVkhP6O9jJe6x63hDHJO0Z0RkasXtjUmh3V+C/iT+0SaoR5QG8Eia5mFOKSI12/mo
 Suh1J6/Xl8+KGKNmGZKmIQhy5WbbvgHq0wXg7iOyDZDp56kZ0BWNGQbvsjXZcWu8d3xk
 3uZKskwTMXzmW7J188vDHPeiRNnNNvUXLFbLYQxaXZe2d+h44FZKztDHV0MCIrEGRePb
 HoLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744332201; x=1744937001;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uyi373n95XP5WRfAJ6QpuXEns7JeJsRyt8nfx137BbQ=;
 b=m6mg7JK466gUIN/W1ZWZdDwpq87BOH9AHnpl46NugHurR2XvsVrffOCyh+zI77EwNO
 rm9yzUGSYUiAEjOOnPtdPqz3WPqh2JRqWuxKRVlS6FjRjaeSmcnYWDkGBOtDLZCkWS/C
 9K9Rx+9Uf3MP1nXYSVLCuAwq5AkBEcr7M6xOw0b6A5ztdFjudlVXYrPfHlZrPu1dP9S+
 rOO7xCV7Gx853NYWn6MgWbqlhbUSHcu2Tdu1FpMv6EmK+yB+QGx3OYkB8Ai4QJmZcbDo
 wpCVYBq90pyhbAgTi8Gf8cj5kZEL3Y8G63KL3CytXsvV4ERLERK8pEd7hPclg/aS18Ho
 av7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqrLBiIwdNv/Y00jFljYPvlkbLV2B4uQjftTAN+PVckLGN0JAgS3PrmJ/NkkyEii42Fajgn24fZww=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwoREoe7JbH/VSbxnfdZgJxqOQgsIMtuaTrrB2obZArzGOIfrZn
 bQHsBaZ3CBrw4vmuCQMH5SfWqEDAoca5dp09vzD0dnhF5h+D/vaQBYD/PwcgWyOD1B9OlUG7yH8
 x97ExdMdeOy+m0HvH7SHIh8FCKnk=
X-Gm-Gg: ASbGncuC2vnms0tZhMeVX65H08xyLReWVpPMaEv3bvXrGgK4ttM2qro7LlE58iSdBuE
 BICGZtaLhMsNT7bA7pklLfQQSVI/e2PDL/M4S/aL1+1KjN7nEFSiV/bKgwZZmEHxGhqjTKWQ/r/
 ZY37R37PRfqxAJsoYQ0xLa
X-Google-Smtp-Source: AGHT+IFOZgvzFBpuXRcPT35FR4/Iom095HHvEYYpnHdDBg8O0o49qunB8TKSvlJDTF8V3f7fQmLgMLZLA79RUsdZ8hM=
X-Received: by 2002:a17:907:d7cb:b0:ac2:758f:9814 with SMTP id
 a640c23a62f3a-acad34b6278mr63743066b.23.1744332201090; Thu, 10 Apr 2025
 17:43:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250325235522.3992-1-dakr@kernel.org>
 <32e7da7e-de32-4bc6-a751-f604da36a63f@asahilina.net>
 <Z_VXBZcBsk2k6eVN@cassiopeiae>
 <143206f6-cd97-4ef8-a4f3-f68d703903bf@asahilina.net>
 <Z_V2ZxIZxI_HiHM5@cassiopeiae>
 <ebbb4d4e-4778-434b-82d7-188f8f6152ff@asahilina.net>
 <CAPM=9ty5dNQOJUj=wtubGYGt5Kt3QeQAQ9rjM2P0dwjBUFspMw@mail.gmail.com>
 <34a4a130-98d1-4cc3-8dcf-b72b3ed36c10@asahilina.net>
 <43ec8aba-f279-422d-95d1-68daac7eaed9@asahilina.net>
 <Z_ecMl2QtAssfczJ@pollux> <88270028-7541-4184-a118-96c182109804@asahilina.net>
In-Reply-To: <88270028-7541-4184-a118-96c182109804@asahilina.net>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 11 Apr 2025 10:43:09 +1000
X-Gm-Features: ATxdqUG_0rRJbh2_knffrJkkAfHJ4Mk1byqpkX0jXcT2607kJgRnLGNNFKx1Sgc
Message-ID: <CAPM=9tyXAdaota38cgeQc86teEebe9XOnBTZ+aDBZpzEBApD9A@mail.gmail.com>
Subject: Re: [PATCH 0/8] DRM Rust abstractions
To: Asahi Lina <lina@asahilina.net>
Cc: Danilo Krummrich <dakr@kernel.org>, maarten.lankhorst@linux.intel.com,
 simona@ffwll.ch, 
 mripard@kernel.org, tzimmermann@suse.de, lyude@redhat.com, acurrid@nvidia.com, 
 daniel.almeida@collabora.com, j@jannau.net, ojeda@kernel.org, 
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org, 
 aliceryhl@google.com, tmgross@umich.edu, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
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

>
> > However, I understand that you prefer to have primary authorship, even if the
> > code has been re-organized in new commits, moved, modified or rewritten.
>
> Correct.

For anyone working in this area that is intending to upstream anything
from asahi, I think if code is rewritten completely it's probably not
consistent to keep the primary author. Copyright doesn't cover ideas,
it covers the code. It's fine to add acknowledgements and other tags.
For all the other cases where it's just moving code around or
modifying it, please try and retain the primary author. I'd suggest if
anyone is basing stuff on the Asahi tree, they try to take things
as-is as closely as possible, then use subsequent commits to
clean/fix/rework, this might mean we have to live with some messy
history that isn't easily bisectable, but I think to avoid any
confusion later and to keep from repeatedly bothering Lina with kernel
development questions on what is acceptable for what patches, we
should try to remain consistent here.

If you write new code from scratch without reference to the asahi tree
at all, please try and state this is a clean implementation to avoid
future possible confusions, if you are aware there is asahi code,
though I realise that could be contradictory. There are often cases
where there is only one way to write some code and I'd rather we don't
fall into unwarranted accusations of bad behaviour.

Dave.
