Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12872CF6193
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 01:42:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D344510E0C0;
	Tue,  6 Jan 2026 00:42:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lWocaZnS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com
 [74.125.224.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD0B610E0C0
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 00:42:45 +0000 (UTC)
Received: by mail-yx1-f47.google.com with SMTP id
 956f58d0204a3-6467bed0d2fso494267d50.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 16:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767660165; x=1768264965; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QrzGH0rfY1PbzfL/LCC45gDfqDTjAUZLlnoS+Yp6OBQ=;
 b=lWocaZnSUqlCWVzgVuvTlFSjrpVjw48rJjQpqPWRPBYIDnmcuLa1YhG/GWHs5f6B52
 psYZS3OidkUMEc+Kr7OIjHyV35rvPonGwWDv9ggKPSAmHYrZo9e357TMLrmyVS6uFX1f
 PzZHseL8kSpGKFkgq8DyT1Zk5KecyXl1vjd0F1kxhvIJ4HexnT/JMu6o1RZ9kOBpZeaW
 ifEnijy5TxF16XKuKA/Pdmca0XNycyBqe5UNwE4vEHgT6MRGArcLK6LszsAOjU4XTzhh
 6U29E99eK3U3D5Z7yUd27Y5+WOMAtsFHrkdwM8jNe5zkpI9nx2IpJGhqp63sniLOGEWc
 s97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767660165; x=1768264965;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QrzGH0rfY1PbzfL/LCC45gDfqDTjAUZLlnoS+Yp6OBQ=;
 b=fhpcLFH8hdlWp7z2pDhfbDLC/OBNkVBLawwvpqnkpRP/8/W2x4j+mzFgXwQPSUpIQb
 gi5LMNJNvczm+HBLp3JD3H7jIry1CQw9GPHgI8+4h+gsl3GT7BcXetWB8S8drWixviIg
 vdbCCpcgfIX3U5+urzGWv64uI77tE3aktKfKFyYYfHBo8UP5s1vj0L0Dagwu1NNC4cjW
 iatRJVTLeRnVEmgfh3qFVfOTd+fEAr8rDM0PEEINyqNIXN8T70HxWX2gejv2gVmyXDlY
 Am6GgGPPTjy8M94kP1Bo+9JhSnnZlSaGbuAXyW9HsrZg+l4e2g7PVkJmVZS/LGGbvvmp
 gqAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFL9qGgeK4vNPLnXOSYP7belRMAKeKEA+LsbRHwy5xdiF+c69mzrtWFa1jC76y305XeZFn+adOlDI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyG0D6OLgeyfBb8ZUBU6j4+c0gU/yfq8HRjpKHKH08efA+6ra97
 CAnjSetmGiSISt3uOFEfkgCgXMJT6xave+2J2Wuz3FYldEm2lJWAzKcJDud9+xQ0cRRz0Jlaz1j
 VvUEPhD7Fb/khMWysNm8OGUvAOA6XTJY=
X-Gm-Gg: AY/fxX5s016E5V8poX1trLrEEtU3EGYppV73RKyLj/Pt/qhg8hnoTSjTy5Nteo/gfB3
 RLQEwdenBnnTpY+GCYcUsNrFLFYQvyWCEo3Z18MeGtGyg1R+jcoledSGdSZK2HkIBnAFeAHmJKa
 3jUDfTzx3e/1OiMJt9iE1RWXjEvxTX6+vjgmYghmc1jE5NPlDFN0wiX6oa9vQAmGjKG7PlO88cL
 TQrmqS8LaPAgrjUruxZ38EkogXSXz9byPFR3sZze6hWmnnptDrkgtStNXPVu0WtYGImb8VxIP3z
 lZbnt6Ux
X-Google-Smtp-Source: AGHT+IHL3mPJHriDypHyBEX+RJjLxwusS7faLWaHDC2qzlYJncxpcgVjuftmU+FyBZTns1j64beDONSID2hEF9V6+GA=
X-Received: by 2002:a05:690e:4144:b0:646:68b4:a7e with SMTP id
 956f58d0204a3-6470c83e595mr1080386d50.18.1767660164612; Mon, 05 Jan 2026
 16:42:44 -0800 (PST)
MIME-Version: 1.0
References: <20260104110638.532615-1-sun.jian.kdev@gmail.com>
 <20260104110638.532615-2-sun.jian.kdev@gmail.com>
 <aVvmr2qOrFvoEKGV@smile.fi.intel.com>
 <CABFUUZFeO51MW5n1uDp0tcwJeJvgxDRxY3rDqkj2Z-6cO23TwA@mail.gmail.com>
 <aVv_w643SMuIELDE@smile.fi.intel.com>
In-Reply-To: <aVv_w643SMuIELDE@smile.fi.intel.com>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Tue, 6 Jan 2026 08:42:30 +0800
X-Gm-Features: AQt7F2oAGQEcEWE-V0GUrqr8ClkpEqurhwv9xHbSb0ypc4-wA_p502-iDKi-NtM
Message-ID: <CABFUUZH0pxar-tTK6LA3j9x_eokLK=FW0B6Uej33s=2YsgOcgA@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] staging: fbtft: core: avoid large stack usage in
 DT init parsing
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Jan 6, 2026 at 2:15=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Jan 06, 2026 at 01:00:33AM +0800, sun jian wrote:
>
> > Thanks for the feedback.
>
> You're welcome, but please, do not top-post!
Sorry about that - I'll use inline replies.
>

> How can you test without hardware at hand?
>
>
> I already explained in the response to the cover letter. Please, read it.
>
Given that=EF=BC=8C I will drop all the changes.

Thanks,
Sun Jian
