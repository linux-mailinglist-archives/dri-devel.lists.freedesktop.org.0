Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB1FA2351F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 21:35:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD1910E0A8;
	Thu, 30 Jan 2025 20:35:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="fLhFS94g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D4D10E03B
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 20:35:02 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-ab39f84cbf1so226174466b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 12:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1738269301; x=1738874101;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i90LZEJP39KZzuaancmUFtDGdMy9w3zyTcWopQWmg60=;
 b=fLhFS94gbl2hPDuYArBvd496Gc9ZxKcOwMD+3HrLV3cNz33SZey+7ETGrqzVp6lxE9
 iGH2Kq5L2dfDEwAXpuHpuJpmXRSSaBHlEQjKpYAwM/Qe/2ewZ0DnSwGwQWxCBk0I5RSU
 BMbG1dFlg52WIvNedViuQTI1a741mcM05y1G3oG9jpfizXMgFrIztUhVDRvJYEtHkZPm
 fOrhhP0lsALSXDD3H2JYxh9kmiVvmnrgYhaC+5J7S/0JzP6NXxePbnccEtntmGxQ4EJP
 wih+QWjFkNtlAHBgwx7T//IW82y/g0OjoyM+W5UALwkraFJNjaJFGLsJ5KrjcUUGvDOv
 OyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738269301; x=1738874101;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i90LZEJP39KZzuaancmUFtDGdMy9w3zyTcWopQWmg60=;
 b=Fsucv+n7xo2dYWN3Nw2iZ7TwhThUMB4qIKoIc8q/UpKnAP3PgkDqhdL9ncZiWPLToL
 D49S91yt7dpqpFDaMdKaKzM5URWHw1uYvoAHZ3SYwe1LuYO04tf7sYXK8KrzRyWhke2x
 GduGi7vb8RTq/htVOji5aGw8iLliBkL/Lib9IXNdVWYZGNhxOnv5Hcz6vbqNOTg+D4BM
 gF1SRlnlVXLi5y0TnXMjYh1zpGHlp/nhG9TIeGU9U+eKbg0KnttQHV3DWcK+yMZxS9tl
 zB1W2JO/uV6nNIvZFUanqakOAiBgYtKtsNcRxHbgBjhaurNcot7fCNqoMHlNYr0sDU42
 86Kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVv8ETUzGANIs1zng8Qh0qtMnpbhhiFCNR4Pb1z0xSA92/7uPAGumz90xp/egpPg8H2bgjKRbsv5M0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVFqcWa5Gz+UctQpO1cgYnBkUdL/PAQuOb5aiuIPp+cjk3arUA
 idbFDuAznrgqALh5Z9aGv33E6qHjJurlqsimbuaRcAHVCmjcVgwJmcClUoYuRef4kWFpmxXLtHN
 4H3wIEvDGkdntbSkvNUmRFXFOo2ZyVKYY8J5Y
X-Gm-Gg: ASbGnct+IkAP4raSV+UEWX6jP3s2xhcEFM/gzBQUaYgUhC4DnWYwzH9Qz5e3h1ky8oi
 lSwCynBf+20pMUyQZfXyE/kBd8uBWapl/kFhpno8Z3uG6Cl8XgWBaY/B46Kf1Z/q+SvAERFfkkU
 Y0nsquniqky0ebwSraoff/AGlKEqz++g==
X-Google-Smtp-Source: AGHT+IGECMPAgyniOqYNB21R66I8EdMyOHzZpuuSW7CxtAKNGfo7YHvttie355d+QCVHN1qEbYdE+9qUUvFsylnBIlM=
X-Received: by 2002:a17:907:1c0e:b0:aab:8ca7:43df with SMTP id
 a640c23a62f3a-ab6cfe11fa5mr941990066b.39.1738269300801; Thu, 30 Jan 2025
 12:35:00 -0800 (PST)
MIME-Version: 1.0
References: <20250130100050.1868208-1-kirill.shutemov@linux.intel.com>
 <20250130100050.1868208-6-kirill.shutemov@linux.intel.com>
In-Reply-To: <20250130100050.1868208-6-kirill.shutemov@linux.intel.com>
From: Yu Zhao <yuzhao@google.com>
Date: Thu, 30 Jan 2025 13:34:24 -0700
X-Gm-Features: AWEUYZl3-5-D2vyBu6SH4C2leVIlg1PIhkFjDOkk3Xxy6Plb6I0iqOiSPQjOIdU
Message-ID: <CAOUHufbZAp9jJb7AA_LF2sS9TbN-T4ssSrp2GbqWSAbf5rUCVg@mail.gmail.com>
Subject: Re: [PATCHv3 05/11] mm/truncate: Use folio_set_dropbehind() instead
 of deactivate_file_folio()
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jens Axboe <axboe@kernel.dk>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Chengming Zhou <chengming.zhou@linux.dev>,
 Christian Brauner <brauner@kernel.org>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dan Carpenter <dan.carpenter@linaro.org>, 
 David Airlie <airlied@gmail.com>, David Hildenbrand <david@redhat.com>,
 Hao Ge <gehao@kylinos.cn>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Josef Bacik <josef@toxicpanda.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Miklos Szeredi <miklos@szeredi.hu>, Nhat Pham <nphamcs@gmail.com>, 
 Oscar Salvador <osalvador@suse.de>, Ran Xiaokai <ran.xiaokai@zte.com.cn>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>, 
 Steven Rostedt <rostedt@goodmis.org>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Vlastimil Babka <vbabka@suse.cz>, Yosry Ahmed <yosryahmed@google.com>,
 intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
 linux-trace-kernel@vger.kernel.org
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

On Thu, Jan 30, 2025 at 3:01=E2=80=AFAM Kirill A. Shutemov
<kirill.shutemov@linux.intel.com> wrote:
>
> The recently introduced PG_dropbehind allows for freeing folios
> immediately after writeback. Unlike PG_reclaim, it does not need vmscan
> to be involved to get the folio freed.
>
> The new flag allows to replace whole deactivate_file_folio() machinery
> with simple folio_set_dropbehind().
>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

Acked-by: Yu Zhao <yuzhao@google.com>
