Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B028C61F8
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 09:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C0110E4F8;
	Wed, 15 May 2024 07:44:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ETTowngh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2891E10E4F8
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 07:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715759084; x=1747295084;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=K4kAGuOpJxBeMR04GdJUSnqhT8BRz91SThcW+SrqY08=;
 b=ETTownghloQibQSOZ3fU/zimCCfaCJe9oPAqoWuoHL2rXF2YcVpi6cba
 /rlHzXCI/owt3/MyRnFYulLZnANwiKt3QV0qX4DxRu7b+uuYaWIQtBxKG
 PqWEJ3mgLnsi0hSbPO74oJWlIgM2R6Z/qqtfUItI5p7FmrLbabUqCU76M
 pQmxXfmpDo/sv8UGJzTXJ5ZEs0RwcZTKakNil7Lk3YEd8dPb4XnvzyTSJ
 eAtH/7yyJaDVQGo1nhwlN1lGYQ9ARDv0FuosvDIgR5jC4+JnZo3GKb/TV
 QD7uIZvTawchPj/IF/pzOOgcNMGVHn6nLQodYpVpb8wHTEK9XaEHt0LLw g==;
X-CSE-ConnectionGUID: a6RPI8KKScW/cxSre3YV/Q==
X-CSE-MsgGUID: vQzf5pzTRgGjssoW4FsJWQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="23195428"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="23195428"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 00:44:44 -0700
X-CSE-ConnectionGUID: aUi1KWfiQiuhNZR+2xH4SA==
X-CSE-MsgGUID: kMvvaWsvSR6kvWC1H1YDUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="54167584"
Received: from vcouthon-mobl1.ger.corp.intel.com (HELO [10.252.52.209])
 ([10.252.52.209])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 00:44:42 -0700
Message-ID: <51cc7889-7a83-4228-bf83-f0d993355e4a@linux.intel.com>
Date: Wed, 15 May 2024 09:45:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 05/12] drm/panelreplay: dpcd register definition for
 panelreplay SU
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
Cc: "Manna, Animesh" <animesh.manna@intel.com>
References: <20240510102602.3172283-1-jouni.hogander@intel.com>
 <b7d802e06d5c33ec9774814d421f610621e269e6.camel@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <b7d802e06d5c33ec9774814d421f610621e269e6.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hey,

Den 2024-05-13 kl. 10:55, skrev Hogander, Jouni:
> Hello Maintainers,
>
> Could you please ack this patch? I'm planning to merge it via drm-intel
> tree.
>
> BR,
>
> Jouni Högander
Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
