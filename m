Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B5D7AB114
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 13:42:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F1310E657;
	Fri, 22 Sep 2023 11:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A6210E657;
 Fri, 22 Sep 2023 11:42:39 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:d3ea:1c7:41fd:3038])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id AC2806607298;
 Fri, 22 Sep 2023 12:42:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695382958;
 bh=KnnpNkUp6NVHJrWtb6K3OPWOlfStBlM0EGcGjz+X0PM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hzpJfo/vLjeT6mw4pwOylse0e+3cGZMrTaRUkFyxnU9v3S0lTBpYkt5lfpB71W+iD
 6kyhoERwt/rLTBvy17mwtCt4lNHHTdAjUF+Hfkkjf5N4TNnmwowv2pIET/olWly201
 vlDrPDEnHHS0nviGXyMfnz77KW8zxDYxGRvZLqrTatid/2Lvv/1hFyftD3TfEbPVma
 2wfo+U98OKbxtFHCAUhn+K9HeQn0vmGDUkpvlQP3TmqmHjHB8KG5uKik3UKkRxGq19
 MDfPOjd1I1fuEmNDysmEC8BbzS3q6OdfkLc7mgqBfCDHBjVmr5JCuaSgX90XAGEp09
 RhDucKoaWP5OA==
Date: Fri, 22 Sep 2023 13:42:34 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-misc-next v4 6/8] drm/gpuvm: add drm_gpuvm_flags to
 drm_gpuvm
Message-ID: <20230922134234.4aa8634d@collabora.com>
In-Reply-To: <20230920144343.64830-7-dakr@redhat.com>
References: <20230920144343.64830-1-dakr@redhat.com>
 <20230920144343.64830-7-dakr@redhat.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 20 Sep 2023 16:42:39 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

>  void drm_gpuvm_init(struct drm_gpuvm *gpuvm, struct drm_device *drm,
> -		    const char *name,
> +		    const char *name, enum drm_gpuva_flags flags,

s/drm_gpuva_flags/drm_gpuvm_flags/gc
