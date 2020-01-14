Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAB513A2D7
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2020 09:19:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B73D26E311;
	Tue, 14 Jan 2020 08:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90EAA6E2DE;
 Tue, 14 Jan 2020 07:58:15 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y17so11126743wrh.5;
 Mon, 13 Jan 2020 23:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=rbig32eOr50Fg3Pl+aEs/mNBrNThyFSHZWhVDQMxVUU=;
 b=CF/xuhzmVCRthuwJH06L18yseaKb7oIXNzM152sOtUAKNQ+YGt8p0UuH0t5KvJop+7
 CF1e3iJdULcUGDZl+0D+R3UUWIZ3Ytb96EOBDCtkCxq1Yrrnv03SE9t8QoKd8uO5nTDq
 Tn87CN+c/Yv35vPFg/vlEho5bsYjXmX9QVrcPEEbIAPEuH9IAHc2xbYZ6LG9PizvQy2N
 xfDC8GCUotkzreEMrT3nZQ0Fd5CiK+pimz6fND0la5j38JuOEbRZ12LeztGSLZId+zjv
 Ic2HeH7zK+Q3eiYOFQzW6exqSs+6bPVE4dHg7gBMPyCmM1qiv2lex2qajD7Ddqu9H5n9
 kv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=rbig32eOr50Fg3Pl+aEs/mNBrNThyFSHZWhVDQMxVUU=;
 b=VDIi9IeTyg/06VkiNBc0nA8C7eOgarIBwCjDqk9RPZ+12KZ7dZnojSk5xeuZPyXfLo
 VGJOYQDhSyy8/Brsm/2bTytSNNGTUxY1onNjngUX7SxHFIGTegUOqwvsZZMOiM3EeJ4q
 IzmxX2oSYxQUGJDmX5UIB4JBRbHuzSa0ImU5yZ/e+tRuAGeJHgAc9CGp7o3efCMH4ucp
 AqiSVqZJKrX5L7/64ZMGyh6ZfksBlLT1Oz3Q3LuHZLCZbgy1H3Ni9LuvgIcoDjBeEfL/
 TTzqIZ6zwv4L78/1WfE+OsYu5dkBhfee3Q+Jfcg+/vcMEWzle7uduE2A5uCsmEyUOAYn
 QwJw==
X-Gm-Message-State: APjAAAXoY1He1/eG5VNY5R2aO2w9Yuxh2CliBdvkZ2i676Lfc9OrrBfS
 IFfUcyVAhWXlCg/jYw4fm9I=
X-Google-Smtp-Source: APXvYqxOFNKkysW5IxjL1XmW18JG1x16t20l6Ie3rcKpVfh4ZhISo4dMlH20xO3vOn3h/zvIllwx5Q==
X-Received: by 2002:a5d:6ac3:: with SMTP id u3mr24104295wrw.25.1578988694185; 
 Mon, 13 Jan 2020 23:58:14 -0800 (PST)
Received: from wambui.local ([154.70.37.104])
 by smtp.googlemail.com with ESMTPSA id
 t131sm17972758wmb.13.2020.01.13.23.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2020 23:58:13 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
X-Google-Original-From: Wambui Karuga <wambui@wambui>
Date: Tue, 14 Jan 2020 10:58:03 +0300 (EAT)
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH] drm/i915: convert to new logging macros based on struct
 intel_engine_cs.
In-Reply-To: <157891427231.27314.12398974277241668021@skylake-alporthouse-com>
Message-ID: <alpine.LNX.2.21.99999.375.2001141057240.2558@wambui>
References: <20200113111025.2048-1-wambui.karugax@gmail.com>
 <157891427231.27314.12398974277241668021@skylake-alporthouse-com>
User-Agent: Alpine 2.21.99999 (LNX 375 2019-10-29)
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 14 Jan 2020 08:19:25 +0000
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
Cc: airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com, sean@poorly.run
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On Mon, 13 Jan 2020, Chris Wilson wrote:

> Quoting Wambui Karuga (2020-01-13 11:10:25)
>> fn(...) {
>> ...
>> struct intel_engine_cs *E = ...;
>> +struct drm_i915_private *dev_priv = E->i915;
>
> No new dev_priv.
>
> There should be no reason for drm_dbg here, as the rest of the debug is
> behind ENGINE_TRACE and so the vestigial debug should be moved over, or
> deleted as not being useful.
>
> The error messages look unhelpful.
Hey Chris, could you please elaborate on the debugs that should be 
removed? These patches are for just converting the current debug 
instances, so removing them might need separate patches.

Thanks,
-wambui
>
>>                 if ((batch_end - cmd) < length) {
>> -                       DRM_DEBUG("CMD: Command length exceeds batch length: 0x%08X length=%u batchlen=%td\n",
>> -                                 *cmd,
>> -                                 length,
>> -                                 batch_end - cmd);
>> +                       drm_dbg(&dev_priv->drm,
>> +                               "CMD: Command length exceeds batch length: 0x%08X length=%u batchlen=%td\n",
>
> No. This is not driver debug. If anything this should be pr_debug, or
> some over user centric channel.
> -Chris
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
