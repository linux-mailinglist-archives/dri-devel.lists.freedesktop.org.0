Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A65B29090
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 22:40:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D2010E2EB;
	Sat, 16 Aug 2025 20:40:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TVIIuHqI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C9A10E2EB
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 20:40:45 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-b4717593371so404296a12.3
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 13:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755376845; x=1755981645; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NQJ4r+9HntyCspbZDSuL92d40bOt1SumIFreNDuCFew=;
 b=TVIIuHqI/L+hEMszUZnfRtDCqQMZ9StP2+TwckaxUw+BS/QnYjJOnALZt/RUdi44D9
 VoLQ8SN+UfebysRFaHiYy2XquRXbmI7YP1uNv8ZRSr49H8+l30P3MoUjtNylLM11S1nf
 3oysPJzcxliU6ffFgayQl1VifqDZgPBccU4eUWc/vITc/z3knugXvq9L82s5BMGH496H
 hF/HO1qRkHUSky4eswEruSJIB+FRsctt5OkoDmhFqxmh/oSP6gVNDlZfAmxAoRp1S7wb
 +eVDVHNCSWxDQ72utb8mSww2dFjKbVX4Hh0Io8T8eYnc7cM6nw/UMj2FCugG+o3Qu1Qt
 Rs8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755376845; x=1755981645;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NQJ4r+9HntyCspbZDSuL92d40bOt1SumIFreNDuCFew=;
 b=FzgoZZg/J4jM3+t8JgIN+QUhIKLc4BqRJSV5uHl2pYSE2cS8LMp4QeEoUB/h/yCIuW
 SX4Jc28Yx9QNII0KQJrE7ySbTS/r9sdfz1NOlZdBKhKXre/xnsGDf9c5yqXA7aZdAK1k
 4TLqm2fg3VE6INCxmTnEgDfN4r+jLWpH8mH7kC25rvZYswOyhrOuTHssXuy1M4jVAO4h
 CM8c+iyBg/i15iwcWOAtOA0UINdHjT5REJL3NsF/4rmGiHeH6r19Kjl5IUDSkNh9uO/H
 zetqkw4IQrCzbnEckBbl02LKnglxSEBCeNSIZUwiuXtCtRFVV47PDQzgfl3fLs7awYGH
 tV4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsc68ZrnW0ay6fhx5XRECjbuoQIprzMPu5jwsOWwvO6Ix02IkTAk5HbWYmmprH73pwudN7sPUtuks=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrX3EmMfNaiCw1+NZdvzHmnq64966Fw0XOyC/YTI2xszI3FiKZ
 h8RGfCPu6a5YbVbBXyQcHwceGIMrg69QAx+vc83vy1Mncbi79hvBIkBp55zQwIXagSz6QRMKLdS
 AIpKgtQJ4pFIRgcZcdYlb8RQ8fGGcP64=
X-Gm-Gg: ASbGncvTyLUuMKJarGqd2GF563pev5yhIX676pBOKJdazcsg89lx74ZzVWLA5q4os5W
 RtHiMSeUCgP8ResH/lStHmg69hM/5XeH11AU4J6aHfMMz1roozn4PaB135yJ1Loe1ZkENRSC4ND
 upkhXjA8wUYTHP6Efau4r8VwdEPevEZ0EKwMjGG1BjLB2lqFTCY5i98t6y+MGJNlubE8byztF/S
 9MwoaUF89Y0FnoPsPsLJyS8sqn0/g==
X-Google-Smtp-Source: AGHT+IGLhy6XoHUsx4g+ZU/gF0IL5YIly3nhuQnXq2tLKmkb/hLfnaLNTwbpGNKpUiPVcLq/xiDrOcahf47iyFTm0jQ=
X-Received: by 2002:a17:902:e541:b0:240:9dcd:94c0 with SMTP id
 d9443c01a7336-2446d6f1c95mr43015575ad.2.1755376844509; Sat, 16 Aug 2025
 13:40:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250731154919.4132-1-dakr@kernel.org>
 <20250731154919.4132-2-dakr@kernel.org>
In-Reply-To: <20250731154919.4132-2-dakr@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 16 Aug 2025 22:40:32 +0200
X-Gm-Features: Ac12FXzilRpwWw4Jjl4--bVK8kvcLn9z3359KfqcqWlR9FQCLCDD3nR0rYIEH4E
Message-ID: <CANiq72mUXy6AYkwCW_kO3ikjNBc5pLzXw0+fXFGmYum0tGmw1g@mail.gmail.com>
Subject: Re: [PATCH 1/4] rust: alloc: replace aligned_size() with
 Kmalloc::aligned_layout()
To: Danilo Krummrich <dakr@kernel.org>
Cc: lorenzo.stoakes@oracle.com, vbabka@suse.cz, Liam.Howlett@oracle.com, 
 urezki@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
 lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
 tmgross@umich.edu, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000043baf4063c8185da"
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

--00000000000043baf4063c8185da
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2025 at 5:49=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> +impl Kmalloc {
> +    /// Returns a [`Layout`] that makes [`Kmalloc`] fulfill the requeste=
d size and alignment of
> +    /// `layout`.
> +    pub const fn aligned_layout(layout: Layout) -> Layout {

I think this `const fn` here was removed when applying to make it work
with older compilers, right?

I was fixing another `rusttest` thing and noticed while applying
these. I had a patch to fix it, since we can actually just use the
feature, and then I noticed it wasn't in the tree. Since I have it, I
am attaching it for reference in case the now-stable feature is
needed, e.g. if you want to make that `const fn` again.

Cheers,
Miguel

--00000000000043baf4063c8185da
Content-Type: application/x-patch; 
	name="0001-rust-kernel-use-const_alloc_layout-feature-to-fix-Ru.patch"
Content-Disposition: attachment; 
	filename="0001-rust-kernel-use-const_alloc_layout-feature-to-fix-Ru.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_meepsu9f0>
X-Attachment-Id: f_meepsu9f0

RnJvbSAzY2YyNGYwNTYxNGUzMzQ5M2JhMDg2YmFiMWYwMmY3MDFjODk0ODA3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNaWd1ZWwgT2plZGEgPG9qZWRhQGtlcm5lbC5vcmc+CkRhdGU6
IFNhdCwgMTYgQXVnIDIwMjUgMjI6MjA6MjkgKzAyMDAKU3ViamVjdDogW05PVCBQQVRDSF0gcnVz
dDoga2VybmVsOiB1c2UgYGNvbnN0X2FsbG9jX2xheW91dGAgZmVhdHVyZSB0byBmaXggUnVzdAog
PCAxLjg1IGJ1aWxkcwoKQmVmb3JlIFJ1c3QgMS44NS4wIChyZWxlYXNlZCAyMDI1LTAyLTIwKSwg
YHBhZF90b19hbGlnbmAgd2FzIG5vdCBhdmFpbGFibGUKaW4gY29uc3QgY29udGV4dHM6CgogICAg
ZXJyb3I6IGBjb3JlOjphbGxvYzo6TGF5b3V0OjpwYWRfdG9fYWxpZ25gIGlzIG5vdCB5ZXQgc3Rh
YmxlIGFzIGEgY29uc3QgZm4KICAgICAgIC0tPiBydXN0L2tlcm5lbC9hbGxvYy9hbGxvY2F0b3Iu
cnM6MTIyOjkKICAgICAgICB8CiAgICAxMjIgfCAgICAgICAgIGxheW91dC5wYWRfdG9fYWxpZ24o
KQogICAgICAgIHwgICAgICAgICBeXl5eXl5eXl5eXl5eXl5eXl5eXl4KICAgICAgICB8CiAgICAg
ICAgPSBoZWxwOiBhZGQgYCMhW2ZlYXR1cmUoY29uc3RfYWxsb2NfbGF5b3V0KV1gIHRvIHRoZSBj
cmF0ZSBhdHRyaWJ1dGVzIHRvIGVuYWJsZQoKU2luY2UgdGhlIGBjb25zdF9hbGxvY19sYXlvdXRg
IGZlYXR1cmUgWzFdIGlzIGFscmVhZHkgc3RhYmxlIFsyXSBhbmQgaXMKYXZhaWxhYmxlIGluIG91
ciBtaW5pbXVtIFJ1c3QgdmVyc2lvbiB0b28sIHNpbXBseSBhZGQgaXQgdG8gdGhlIGxpc3Qgb2YK
dGhlIG9uZXMgd2UgdXNlLgoKTGluazogaHR0cHM6Ly9naXRodWIuY29tL3J1c3QtbGFuZy9ydXN0
L2lzc3Vlcy82NzUyMSBbMV0KTGluazogaHR0cHM6Ly9naXRodWIuY29tL3J1c3QtbGFuZy9ydXN0
L3B1bGwvMTM0NzY4IFsyXQpOb3QtRml4ZXMgKHBhdGNoIHdhcyBjaGFuZ2VkIG9uIGFwcGx5KTog
ZmRlNTc4Yzg2MjgxICgicnVzdDogYWxsb2M6IHJlcGxhY2UgYWxpZ25lZF9zaXplKCkgd2l0aCBL
bWFsbG9jOjphbGlnbmVkX2xheW91dCgpIikKTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
cnVzdC1mb3ItbGludXgvMjAyNTA3MzExNTQ5MTkuNDEzMi0yLWRha3JAa2VybmVsLm9yZy8KU2ln
bmVkLW9mZi1ieTogTWlndWVsIE9qZWRhIDxvamVkYUBrZXJuZWwub3JnPgotLS0KIHJ1c3Qva2Vy
bmVsL2xpYi5ycyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvcnVzdC9rZXJuZWwvbGliLnJzIGIvcnVzdC9rZXJuZWwvbGliLnJzCmluZGV4IGVk
NTMxNjllNzk1Yy4uOTRkMTc0ZWQ3YjhiIDEwMDY0NAotLS0gYS9ydXN0L2tlcm5lbC9saWIucnMK
KysrIGIvcnVzdC9rZXJuZWwvbGliLnJzCkBAIC0zMSw2ICszMSw5IEBACiAjIVtmZWF0dXJlKGNv
bnN0X3B0cl93cml0ZSldCiAjIVtmZWF0dXJlKGNvbnN0X3JlZnNfdG9fY2VsbCldCiAvLworLy8g
U3RhYmxlIHNpbmNlIFJ1c3QgMS44NS4wLgorIyFbZmVhdHVyZShjb25zdF9hbGxvY19sYXlvdXQp
XQorLy8KIC8vIEV4cGVjdGVkIHRvIGJlY29tZSBzdGFibGUuCiAjIVtmZWF0dXJlKGFyYml0cmFy
eV9zZWxmX3R5cGVzKV0KIC8vCi0tCjIuNTAuMQo=
--00000000000043baf4063c8185da--
