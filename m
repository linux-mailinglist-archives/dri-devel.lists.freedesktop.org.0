Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F78EA4E191
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 15:47:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CEBA10E608;
	Tue,  4 Mar 2025 14:47:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="kNF0VxKG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from beeline3.cc.itu.edu.tr (beeline3.cc.itu.edu.tr [160.75.25.117])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B449E10E605
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 14:47:09 +0000 (UTC)
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr
 [10.146.128.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by beeline3.cc.itu.edu.tr (Postfix) with ESMTPS id 3803640D0C8F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 17:47:08 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
 by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6dhn3NH2zFxQy
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 17:43:21 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
 id F09074271F; Tue,  4 Mar 2025 17:43:05 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b=kNF0VxKG
X-Envelope-From: <linux-kernel+bounces-541308-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b=kNF0VxKG
Received: from fgw2.itu.edu.tr (fgw2.itu.edu.tr [160.75.25.104])
 by le2 (Postfix) with ESMTP id 2CACD431ED
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 12:50:03 +0300 (+03)
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
 by fgw2.itu.edu.tr (Postfix) with SMTP id B3CA72DCE4
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 12:50:02 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2385B3A859A
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 09:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F0111F153C;
 Mon,  3 Mar 2025 09:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="kNF0VxKG"
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D481D79A3
 for <linux-kernel@vger.kernel.org>; Mon,  3 Mar 2025 09:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 arc=none smtp.client-ip=209.85.221.44
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
 t=1740995364; cv=none;
 b=oCaM/64/hddOip6/aAl8uqtPwa3pDkhW2ajXv1xsYkEfJ8B4aEuC7NsNQ4TPFewmlbVQcS14T473N6vnWgXY61tkF+U+gpWX0QNtvUvshCaN7VDJHxDzq1jJ6GweLRkYBkhr300AIpA7lGmCStpjXsdfOc0YXqTJRXBwXwcpKbw=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
 s=arc-20240116; t=1740995364; c=relaxed/simple;
 bh=tzlgVVNvAlNlgaa2JvUJRo2pG9JqwRvR3QWZKyunCfQ=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=Zr87bhVJVBe0Q5OnMRf4HsfCLHMAfjAyOUYgVI1A8CXv0eD2hTmm3FD1LVx/hDz7Sayt8vqY7FkTfRebZcAm5tFnIgvRYkDCF0dEU34ScilLO3BSVn8xghC5I4Nra6vFc1BR3Cd8XJOx5vKwAI5ZNdoPeS8Gv7+QjPIHb5kFPKk=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org;
 dmarc=pass (p=reject dis=none)
 header.from=google.com; spf=pass smtp.mailfrom=google.com;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b=kNF0VxKG; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org;
 spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-390e3b3d432so2849359f8f.2
 for <linux-kernel@vger.kernel.org>; Mon, 03 Mar 2025 01:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740995361; x=1741600161; darn=vger.kernel.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SnL9Hz24S3kNKDp8b2cNl9jZ/3k9Ss4gpw9SmsSpB2g=;
 b=kNF0VxKGrJ/XBpY9WttfMcaPrNvGMptak+UZED7TtrbnPhxIpHBH8VNp4lAifF0oUr
 hQSBlI8y4OXaMoqOKhRx0IHOmnOX3TBmCFquYX3U8HHEKwXOBoqd7jFaalxrp8siQQ7D
 DTnctTKSFwsZwlg41ssQ7ZHbVWlMknkmlDdfDFlsk9FGr45xOngR3ESyQGlzrEvBlq8+
 sLHH+cI/PPSpwx03J0EMnnL6lY1yz6dkGAs5SANzBc3sm1BzmhU/VVRwkL45aoLGatxD
 yK/ynBdzb/1gNzlDQwIWURY8KCqfg2Hs6ZACAx2ulj1NO8wu0rSM53XAPe5ZneQfudaH
 CQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740995361; x=1741600161;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SnL9Hz24S3kNKDp8b2cNl9jZ/3k9Ss4gpw9SmsSpB2g=;
 b=Sc4qchDTfnQZ+LMmwPPB5P62bA7nshIuEGUF9njdKBbwabpL1LBGnCGsCBVYUshjEV
 l2cds10OYGy7NK0q6fPI5w22dSZgeS18lGsjinkPd8yo7R5UHdc+xkfxlC+X3y1Ni3p/
 k5FyUSiyLbkWCQ0Nw6NOGivoRAoyNExvECvaBV1wNvOD5V61+UKTxKDORWKYzA8zp/4k
 qh8prBO5HKPfrVJlMKJA/b7Jec/Ql5ruwI+xCaPw0Tkz1LuuwLBxpAJS0HvUyetShzYE
 8czs4il+2hwvh6QMd+TFahtVWZ8OHr36Z9KSuw/2F180kCyn1Bj2fwKcic4ixQj+VfuF
 5jzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW32DXo7mGwKuQqS9vbEj0YcPIkYVQzMKEiE37dWRALnk5UYOCNN2B49Q4/Z7q8Fz+4yTggEazZkPIt1AU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLpNfa0V5gs61eovQAS251opf607m2CI8cj77tQUg1o74UzjpD
 mem+BJQMLz11rrZNxMqSPWn8xsczSxl7hjiQA8OgfSVHXQJmlm2MJZfTOWkHuJbi8GSh5q96YPw
 F1w303Q3mDv4KQdQgN1tGgPDigfd7yQloRhk2
X-Gm-Gg: ASbGnctRWi/Ut68DEi1bBl1UE6bMIsqPg4vBGhSIwQOBrHP0S4/Y4asz11zBznYb7Ue
 NtoJFkGVg6vB1BnRtskFIaZPrAA1CmlXc0OQ+8I0AfoPGL8NIjnKSWGAHAHelUFfwbNDUUI3O5E
 /7DmLiCuBWdiXuWaJENj3h9nihRI+MIMWv8v0RLRcfffgXdJ8xGoTo9EbF
X-Google-Smtp-Source: AGHT+IGTVr2JIj2NM1dARmHjx2Q20a0Sj+PRO/QysiCo1gjTEuQGm9OoWgT0wK6Y1r6W2Tsdd+R6BGWXSNz0RLNl2NM=
X-Received: by 2002:a05:6000:270f:b0:390:ea34:7d83 with SMTP id
 ffacd0b85a97d-390ec9c166cmr8927299f8f.31.1740995361321; Mon, 03 Mar 2025
 01:49:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
MIME-Version: 1.0
References: <20250303-export-macro-v3-0-41fbad85a27f@google.com>
 <20250303-export-macro-v3-4-41fbad85a27f@google.com>
 <Z8V6XafrTyrB4z8D@smile.fi.intel.com>
In-Reply-To: <Z8V6XafrTyrB4z8D@smile.fi.intel.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Mar 2025 10:49:09 +0100
X-Gm-Features: AQ5f1JoxwuAGeit50aUfVN8jQmqWDDJZmGrbhn2c83aPm7MkhBxBt-nYtmFZSyw
Message-ID: <CAH5fLgimM6gL2v4z_x717iYU8LYTfypEi=wkj3mXS4uu8Raq0A@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] print: use new #[export] macro for
 rust_fmt_argument
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tamir Duberstein <tamird@gmail.com>, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for
 more information
X-ITU-Libra-ESVA-ID: 4Z6dhn3NH2zFxQy
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741704319.56523@xT68EbAp7lUGaZLVJne2Mg
X-ITU-MailScanner-SpamCheck: not spam
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

On Mon, Mar 3, 2025 at 10:46=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Mar 03, 2025 at 08:45:15AM +0000, Alice Ryhl wrote:
> > This moves the rust_fmt_argument function over to use the new #[export]
> > macro, which will verify at compile-time that the function signature
> > matches what is in the header file.
>
> ...
>
> >  extern bool no_hash_pointers;
> >  int no_hash_pointers_enable(char *str);
> >
> > +/* Used for Rust formatting ('%pA'). */
>
> In case you need a new version, please drop a period at the end as this i=
s the
> style used in the sprintf.h already.

Sure, I will remove the period if I send a new version.

Alice

