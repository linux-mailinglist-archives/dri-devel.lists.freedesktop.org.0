Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0757E497CC6
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 11:12:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A33FC10E98A;
	Mon, 24 Jan 2022 10:12:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E9B10E8EA;
 Mon, 24 Jan 2022 10:12:16 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id q22so3115052ljh.7;
 Mon, 24 Jan 2022 02:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=00UDOHuVRkKKvQsjGUdxQd27cyZnJBr83FBriMmt9Gg=;
 b=bxMUTKscmSqHPkI0/AOrgAGs+hcPCMv+jTqRAwARzGbfal0wTRrbtmQAfb5oIur3SQ
 G+xTpHsNg9HTswIOMpCVpl5IQH6GjactMS685LLC4y4qQvhCG0x7iw7pAdqTtBwZIR+N
 T/7MmCtwUmtNX5wIjSL1EN6CK9OwJNwUqmgxeuqIcmPFhAxwzTl8+r4rkU+4Oh0ZWmmJ
 rOELz5uCkRo1PqCGZsLs9Bf40xeNYAHhY0C84kdToV+6M5NZL7idiVzGqRvFrW5rl4zT
 kwkpjusn/17wFVw6qnk1MGhWHeAfb2Rj0ePmHv+vdr5oJWADAL3TvF1OAt00Fp8yapKh
 tceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
 :message-id:mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=00UDOHuVRkKKvQsjGUdxQd27cyZnJBr83FBriMmt9Gg=;
 b=hi5LnqWIRliH8ty8x6U++mvG5ymowUPGLMYTbe9iPXIORCZhvXX99a+MgWfrsIXK/I
 mrHZFluwqqyQkSi819+zIuwPLiU64JxSgKF+PNZ5XSyOCQD10InBs7/YWCUsx/9HJVNb
 mUVE6MFiFENbLYfyLicM6e+bjT9qwp/hhP/97AVeAru4QJY5neEteEdz8HaQi9d+XR1P
 ySF3ZxGJnzUhrqk5OhhAohrOsaUMl9PNzw0kvTbwB+qHRpQFhBDykfaAiavazrQif1Lg
 E+WfAP+meLEcgMuc90PEflhEdqj8BCPQRlSMljYr+YUXMKlIc79uf5cR0hN4tikZyluf
 NjWQ==
X-Gm-Message-State: AOAM5312VJai6U6fv6tD2Xxj5zUdxzvrMIu2EqaAVwogd9vAxadr8J1L
 UdY64Arp7USFOR/3N7cXen2cL3pySjs=
X-Google-Smtp-Source: ABdhPJxfjS1VYnBLdfKECvD6iwAfMMAOkdH9CYrYxb2qOSDqEn/9khScfZRqL1SFqDOcd55h1xl3TA==
X-Received: by 2002:a2e:8786:: with SMTP id n6mr10845274lji.166.1643019134022; 
 Mon, 24 Jan 2022 02:12:14 -0800 (PST)
Received: from DESKTOPMNL9DDQ (88-115-161-74.elisa-laajakaista.fi.
 [88.115.161.74])
 by smtp.gmail.com with ESMTPSA id m10sm1119339lfk.119.2022.01.24.02.12.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jan 2022 02:12:13 -0800 (PST)
From: <zhi.wang.linux@gmail.com>
To: "'Christoph Hellwig'" <hch@lst.de>, "'Wang, Zhi A'" <zhi.a.wang@intel.com>
References: <20211129123832.105196-1-zhi.a.wang@intel.com>
 <20211130164622.GA15150@lst.de>
 <e183b95f-89d1-3a2f-27e2-82aa2b10e8fc@intel.com>
 <20220124094004.GA23537@lst.de>
In-Reply-To: <20220124094004.GA23537@lst.de>
Subject: RE: [PATCH v4 1/2] i915/gvt: Introduce the mmio_info_table.c to
 support VFIO new mdev API
Date: Mon, 24 Jan 2022 12:12:12 +0200
Message-ID: <004201d8110a$db3ec9e0$91bc5da0$@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHIPB7b9XYZUM7zLx+SfJYTBroPkAJO7v/TAoSMsnoBvpZ7zKxdDGRA
Content-Language: en-us
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 'Jason Gunthorpe' <jgg@nvidia.com>, "'Vivi,
 Rodrigo'" <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christoph and Jason:

Have been talking with Raj. I am going to work on this series this week. 

Thanks,
Zhi.

-----Original Message-----
From: Christoph Hellwig <hch@lst.de> 
Sent: Monday, January 24, 2022 11:40 AM
To: Wang, Zhi A <zhi.a.wang@intel.com>
Cc: Christoph Hellwig <hch@lst.de>; Zhi Wang <zhi.wang.linux@gmail.com>;
intel-gfx@lists.freedesktop.org; intel-gvt-dev@lists.freedesktop.org;
dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; Jason
Gunthorpe <jgg@nvidia.com>; Jani Nikula <jani.nikula@linux.intel.com>;
Joonas Lahtinen <joonas.lahtinen@linux.intel.com>; Vivi, Rodrigo
<rodrigo.vivi@intel.com>; Zhenyu Wang <zhenyuw@linux.intel.com>; Xu,
Terrence <terrence.xu@intel.com>
Subject: Re: [PATCH v4 1/2] i915/gvt: Introduce the mmio_info_table.c to
support VFIO new mdev API

On Fri, Dec 17, 2021 at 08:52:53AM +0000, Wang, Zhi A wrote:
> Sorry for the late reply as I am supporting the customers recently. I 
> will refresh this after the christmas.

Did you find some time to look into it?  Do you want some help?

