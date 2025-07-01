Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E11AEFD20
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 16:52:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B1B710E441;
	Tue,  1 Jul 2025 14:52:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dlc9BDdz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E4F010E441;
 Tue,  1 Jul 2025 14:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751381527; x=1782917527;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PG27HA4CdVtGaZFt68ZtRQqcdoSo3KFYNbdjHdu9hzY=;
 b=dlc9BDdz7ZoqF+fu7eIFMm6eEl1fcjV3MrznSCYhW4Qr9/G+LX8GUEP8
 8nTz+0Qja9sxLfQ7Utj81mS3D6KzZLJEwNJWOsxuHaUAyZuGVzzR5SfQZ
 NawP9OazD8OSwnog3XstDbqbctUwY3F2ZIEms6jG6UEjbOrdBTHWm8zdm
 D8UhlSh9Mg/bihnLiUynuI8TegkhbKQtph2mGxSaosmXZ5ZJlvAwK7xEz
 /oe3LlpfGH9KnhLa4YKSfzp9/N8xkb7865UnY29p0LyF0HQCT53lXn2XB
 IFvt/9AlHOpJPXIvObCYAamPTSefa3x1MEhPiTc7MyeNSBTKM6GHbmeTp A==;
X-CSE-ConnectionGUID: 0yfW0tUSSamaqy7s3aP5xw==
X-CSE-MsgGUID: U+xYJwukRLKzq8ZBxpNlLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53739818"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="53739818"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 07:52:07 -0700
X-CSE-ConnectionGUID: hoxMVtyTSrytJEUByLiOLQ==
X-CSE-MsgGUID: Vi40ygA8RMaAsuCkpDD1gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="153204157"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa010.jf.intel.com with ESMTP; 01 Jul 2025 07:52:05 -0700
Received: from [10.245.96.176] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.96.176])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 159B4357A;
 Tue,  1 Jul 2025 15:52:02 +0100 (IST)
Message-ID: <bb783b7b-80d8-4779-a8a4-ad495dd9948c@intel.com>
Date: Tue, 1 Jul 2025 16:52:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Intel Xe SR-IOV support status
To: Marcello Sylvester Bauer <marcello.bauer@9elements.com>,
 intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Badal Nilawar <badal.nilawar@intel.com>
References: <72fd3ae7-46da-4203-b583-3fb857e73542@9elements.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <72fd3ae7-46da-4203-b583-3fb857e73542@9elements.com>
Content-Type: text/plain; charset=UTF-8
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

Hi Marcello,

On 30.06.2025 13:47, Marcello Sylvester Bauer wrote:
> Hi,
> 
> Starting with Tiger Lake, support for GVT-g was discontinued in favor of
> SR-IOV for graphics virtualization[1]. Currently, the upstream Xe
> drivers only support SR-IOV on Panther Lake. The table below summarizes
> the current state based on the .has_sriov flag.
> 
> | Intel Gen | drm-xe-next[2] | xe-for-CI[2] | intel lts i915[3] |
> | --------- | -------------- | ------------ | ----------------- |
> | TGL       |             no | no           | v5.15             |
> | ADL/RPL   |             no | yes (debug)  | v5.15             |
> | MTL       |             no | no           | v6.1              |
> | ARL       |             no | no           | no                |
> | PTL       |        v6.13.1 | yes          | no                |

Note that we also have

  | ATSM      |             no | yes (debug)  |

> 
> Interestingly, the xe/topic/xe-for-CI testing branch only covers SR-IOV
> testing on the ADL platform and not the MTL or ARL platforms.
> 
> Is there a reason why SR-IOV has not yet been enabled on the other
> platforms? 

Since platforms before LNL are not officially supported by the Xe
driver, we have only enabled SR-IOV on those SDV platforms which are
actively used and tested by our public CI.


> Are there any plans or timeline for adding support for them?

AFAIK it’s unlikely. While in case of TGL the enabling is just a
one-liner patch with new .has_sriov flag, however for robust MTL it
would require much more SR-IOV specific code to be added, but there is
no point to add anything until those platforms itself will be fully
tested in the native mode (non-virtualized).

Michal

> 
> Kind regards,
> Marcello
> ---
> [1] https://www.intel.com/content/www/us/en/support/articles/000058558/
> graphics.html
> [2] https://gitlab.freedesktop.org/drm/xe
> [3] https://github.com/intel/linux-intel-lts
> [4] https://patchwork.freedesktop.org/patch/603316/

