Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0175B5950B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 13:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 559C310E7A8;
	Tue, 16 Sep 2025 11:23:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="CayZ6hNC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA9810E7A8
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 11:23:32 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-b0aaa7ea90fso214440166b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 04:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1758021811; x=1758626611; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gxtZUSssqP8QQ4xDjcwfBCGzgO78XtwgCRIXLf8n188=;
 b=CayZ6hNCzTM0vn3zTTJ9aRqR3yqLw6z+Ofn5k/dWFIWovjRNNXRNVckCm/y1K/XxQt
 E6SAAoOlxN/EcTqc+jBy7BWfNL4juSxNZ38azURbq7jJjatxSdpoLsu5y4g1cTSSNvuU
 n3PXcljcN0dwmExWZBkwvD98oH1LvrCzCDQzFMlJ4tuAIN64m/ys7U+2J6zql9Pgt0yT
 mKGkBX4HYK9uTI+eIKfr0UuEY/V5Gp2++QcqjyU4ap2b35An+O8pVBE0OHNhJRLKFVbG
 wSmMP6o82asF5HVi02xf++bNRdIiXNExXdu2pNauIopi0xQWUfOuvmJUJzeTUIz+0ZOJ
 Beuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758021811; x=1758626611;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gxtZUSssqP8QQ4xDjcwfBCGzgO78XtwgCRIXLf8n188=;
 b=Fi2fzyPmjY371IJ6X/up1Y2y8Atey5rVe1Dy1TH+ogh0QfDRkrLtTSakanOGDI+5Hj
 twOVxQVMjfMnVxQ0vAXHuoC+efqZ0VWjN0eFhXMf71eZ95OmYO6j1eilTjrfUTI/7ejK
 5ItxfqvUHArdms+qPotVWcCzGwFKevetV4OjzK+PoFR0WAFrvpsVa6QbQMWG0amqKbf3
 M3TQHIgwA5jpBkp6wGyZ84hV9FsXvswoStiFR+HY2DVGlf9sJZC4HlEoDuKiVwxM0SgY
 W8tLGL4yV9cUjNMrEASHPjQpK28uUBzt7n/7fE0GrviCvz4ADvke5uqImVs8oAtwLw+/
 F3HA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6NU7RnbXsSYLxXG9wNl522MObKfqhRwVFvjQeIqzTUWapDB6afQvjjx/KiInEySgNSwqb5snEA1o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqkkI2bsbP5mkkzXXTTCsxNZJR5zL7ph5c0llsUzyN4tfVXwuG
 QGQwGTjv0mzs6976Z8RtwllGKKItxpV3cnhflpLyz6yRJQ5adbTitVPbC+yUi+EaN64=
X-Gm-Gg: ASbGncvuvNNm/Pg0bW8AD6+TMBA+wsirtXKvdFMMkrCl+uSyrZMgDGijpeqcUlILqsg
 1qeQP6vJcL3oWATw7j4M8tQCDzwIs72N2tzIsPmgSvDCVFUmG7kCYAYG6bjzjIE2h3cAkAKSP3V
 u9vHuHPuw+3heiCggagUNZo/JHW47NZs8B4nJ5lEpsrNFdSwmi1Ywu2iDL9D8MKCO6S0N13cKgY
 rK9rny4aCIglU8hXHREQ/7CStkGeBstUXF1Cu1xGJPCtQQ5XhSrFCCO3wTshWW9r3+gZD1LgFok
 kMUZkt3SNOOFwisBrpCFx+xQzea4fH2gcGwt9FkGe++EWA/+ehzi2Fr8dWxbWZRlqzjlWhd8eMR
 NN8V5P7gwm4IdLIiIna6e/eeaEVT+mpeojyZEVT38
X-Google-Smtp-Source: AGHT+IHpyTR/3eF3SMuNwTyjqfOeFBdU6maF0JBSLHjxTUYrHkZ3Z43YeF6fl1FdRdLJxJTI3BmjLQ==
X-Received: by 2002:a17:907:7e83:b0:ad5:d597:561e with SMTP id
 a640c23a62f3a-b07c3a7bd75mr1672253566b.56.1758021811303; 
 Tue, 16 Sep 2025 04:23:31 -0700 (PDT)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b32dd5a9sm1125541966b.57.2025.09.16.04.23.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 04:23:30 -0700 (PDT)
Date: Tue, 16 Sep 2025 13:23:28 +0200
From: Petr Mladek <pmladek@suse.com>
To: Jinchao Wang <wangjinchao600@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>,
 Yury Norov <yury.norov@gmail.com>, Qianqiang Liu <qianqiang.liu@163.com>,
 Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Steven Rostedt <rostedt@goodmis.org>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Shixiong Ou <oushixiong@kylinos.cn>,
 Zsolt Kajtar <soci@c64.rulez.org>, Ingo Molnar <mingo@kernel.org>,
 Nam Cao <namcao@linutronix.de>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Joel Granados <joel.granados@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Sohil Mehta <sohil.mehta@intel.com>,
 Feng Tang <feng.tang@linux.alibaba.com>,
 Sravan Kumar Gundu <sravankumarlpu@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Anna Schumaker <anna.schumaker@oracle.com>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Max Kellermann <max.kellermann@ionos.com>,
 Yunhui Cui <cuiyunhui@bytedance.com>, Tejun Heo <tj@kernel.org>,
 Luo Gengkun <luogengkun@huaweicloud.com>, Li Huafei <lihuafei1@huawei.com>,
 Thorsten Blum <thorsten.blum@linux.dev>,
 Yicong Yang <yangyicong@hisilicon.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kexec@lists.infradead.org,
 linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 8/9] panic/printk: replace other_cpu_in_panic() with
 panic_on_other_cpu()
Message-ID: <aMlIsOH1dirXjrE1@pathway.suse.cz>
References: <20250825022947.1596226-1-wangjinchao600@gmail.com>
 <20250825022947.1596226-9-wangjinchao600@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825022947.1596226-9-wangjinchao600@gmail.com>
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

On Mon 2025-08-25 10:29:36, Jinchao Wang wrote:
> The helper other_cpu_in_panic() duplicated logic already provided by
> panic_on_other_cpu().
> 
> Remove other_cpu_in_panic() and update all users to call
> panic_on_other_cpu() instead.
> 
> This removes redundant code and makes panic handling consistent.
> 
> Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>

Looks good:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
