Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8081C8005D9
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 09:38:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33AC510E819;
	Fri,  1 Dec 2023 08:38:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72BF810E814
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 08:37:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D8E8462099;
 Fri,  1 Dec 2023 08:37:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37415C433CA;
 Fri,  1 Dec 2023 08:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701419877;
 bh=rWGsZEZIR1EQpORLK+Bl7woMovPPcwnfUDDgud9gyiA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=KT5LQD3Q8kgWWWRfyE38tdXGgiMfqQ+WNTDm9b+APrpt7/+D4Ok7xTlDWjwUvKj4n
 6yMT4UutwPHwW7EXughSVMOz/B4xpc+RElRGj24khVA1E5t3MrsWLlCuBCaR9NJK5q
 D+qooPaTU7oxWvuTBnbsCZEIfUIU/Ii3KPECGqpsrNTsmh+P6lAV0P+rAl0sHAEuC3
 QHD9Up8rgEjrIzz2nb39T+whTo1Hv0MtbumRVge1qpb8ocdq+6lbD7II4YwUiwZ54R
 jkPDqDiX0w7QzXdgEgrBfPjipwOaeDelE7x4W90aiucECQ8i7GQARjKSXFRM6ZNd3u
 f1Gav4Vae6kZw==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Donald Robson <donald.robson@imgtec.com>
In-Reply-To: <20231130160017.259902-5-donald.robson@imgtec.com>
References: <20231130160017.259902-1-donald.robson@imgtec.com>
 <20231130160017.259902-5-donald.robson@imgtec.com>
Subject: Re: (subset) [PATCH v2 5/5] drm/imagination: Removed unused
 function to_pvr_vm_gpuva()
Message-Id: <170141987488.3198881.129685975104737563.b4-ty@kernel.org>
Date: Fri, 01 Dec 2023 09:37:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: matt.coster@imgtec.com, boris.brezillon@collabora.com, tzimmermann@suse.de,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 30 Nov 2023 16:00:17 +0000, Donald Robson wrote:
> This function is now unused, hence it causes a compiler warning.
> 
>    drivers/gpu/drm/imagination/pvr_vm.c:112:22: warning: unused function 'to_pvr_vm_gpuva' [-Wunused-function]
>      112 | struct pvr_vm_gpuva *to_pvr_vm_gpuva(struct drm_gpuva *gpuva)
>          |                      ^
> 
> Remove the function for now.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

