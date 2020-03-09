Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 202F317EA01
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 21:27:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5AB6E176;
	Mon,  9 Mar 2020 20:27:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 908266E176
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 20:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583785663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4OsqZRBJnfSwqjz8mSam3+/g3YANUHel3btfFdnOeaQ=;
 b=CdB4n/9PY78hXawMTec92v+k8bAawibfaTVONGDmpMd09PRiUFYzz9q3Gz85i4nrmqYc2g
 hJBCbf+1QjUQAF+sed1iGR9DH41wDOEBY7IBEoc0A4VoFmbAHrDEutbGMHS0mquuXxGatI
 ABXhTp1z4/efXebnJPcsiLQRSzJX2Xg=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-JBeRZUzoOG6Z7bvQbsuS2w-1; Mon, 09 Mar 2020 16:27:41 -0400
X-MC-Unique: JBeRZUzoOG6Z7bvQbsuS2w-1
Received: by mail-qv1-f69.google.com with SMTP id dr18so7536267qvb.14
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2020 13:27:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=4OsqZRBJnfSwqjz8mSam3+/g3YANUHel3btfFdnOeaQ=;
 b=Zt1Ug+yinj08LYn0rFI5NtKzw5iwFAl/1oCIW8G7oVfl27C32DFDqHhyPPPjFls8ir
 jeE42ODqKne7KkALkgMZHBecI2GwPUlfNHftFIl167dPjqrHiSzH1X7F+NZof63paLIi
 cHDBhgJIwdBe4KrsnX3v7db5UyNSY2MxCpDEtTTaVyNNjQQtBE6ySSTofi00WZWPVo2v
 rbz/CN9/bF5WT9Yy5frmKnpSHz7b0ZKXZISrSrz2S/t/GJDN0uNDAitxdRoOm1lIqofD
 iyBNfIcgQuuWz5TEv+IUoNforpcOa3GZtvO+kwSJS3899H5eRtkIwlgPKHQwM7Btc4TU
 apkQ==
X-Gm-Message-State: ANhLgQ0yyU5aUVpKa6T57HhuTw5gehuUCLV8XhhTUkbubgZOdekMNeXj
 ruKGpb65ruTe4TKMmZuF4brIHGlqv7K8FdpP2M4ptEWCc1g74lpuk7yXqffZ7W32wNxhNQskVZ3
 UjH1W3jYVsT5a9fkZ7uB7KRqJW3Up
X-Received: by 2002:a05:6214:1427:: with SMTP id
 o7mr7696847qvx.167.1583785660773; 
 Mon, 09 Mar 2020 13:27:40 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vv9kWwtb15Kg/U4mlD0qpDqcRZ3Yf72s23Ve5V0jlZAMb9WId9JHm1Eu+Jk+5TeW3cLuOObYA==
X-Received: by 2002:a05:6214:1427:: with SMTP id
 o7mr7696830qvx.167.1583785660525; 
 Mon, 09 Mar 2020 13:27:40 -0700 (PDT)
Received: from dhcp-10-20-1-196.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id o14sm3219534qtq.12.2020.03.09.13.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2020 13:27:39 -0700 (PDT)
Message-ID: <9e5fcbcd3f7a4d74b9941a21e0407c6eef79e920.camel@redhat.com>
Subject: Re: [PATCH 0/5] Cleanup drm_dp_mst_topology_cbs hooks
From: Lyude Paul <lyude@redhat.com>
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, 
 emil.velikov@collabora.com, jani.nikula@linux.intel.com, daniel@ffwll.ch, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Date: Mon, 09 Mar 2020 16:27:39 -0400
In-Reply-To: <20200307083023.76498-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200307083023.76498-1-pankaj.laxminarayan.bharadiya@intel.com>
Organization: Red Hat
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 2020-03-07 at 14:00 +0530, Pankaj Bharadiya wrote:
> drm_dp_mst_topology_mgr_cbs.register_connector callbacks are identical
> amongst every driver and don't do anything other than calling
> drm_connector_register().
> drm_dp_mst_topology_mgr_cbs.destroy_connector callbacks are identical
> amongst every driver and don't do anything other than cleaning up the
> connector((drm_connector_unregister()/drm_connector_put())) except for
> amdgpu_dm driver where some amdgpu_dm specific code in there.

Yeah that amdgpu destruction code kinda stinks a little bit :\. I think we can
just drop some of it and move the rest into their connector destruction
callbacks.

For the whole series:
	Reviewed-by: Lyude Paul <lyude@redhat.com>

I'm going to go ahead and let the maintainers know I'm going to push this
(since there's some minor changes here outside of drm-misc), and push this to
drm-misc-next. Then I'll go and write some patches to remove the leftover amd
bits and drop the callback for good (I'll cc it to you as well).

> 
> This series aims to cleaup these drm_dp_mst_topology_mgr_cbs hooks. 
> 
> Pankaj Bharadiya (5):
>   drm: Register connector instead of calling register_connector callback
>   drm: Remove dp mst register connector callbacks
>   drm/dp_mst: Remove register_connector callback
>   drm: Add drm_dp_destroy_connector helper and use it
>   drm: Remove drm dp mst destroy_connector callbacks
> 
>  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  6 ------
>  drivers/gpu/drm/drm_dp_mst_topology.c         | 18 +++++++++++++++---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   | 16 ----------------
>  drivers/gpu/drm/nouveau/dispnv50/disp.c       | 19 -------------------
>  drivers/gpu/drm/radeon/radeon_dp_mst.c        | 17 -----------------
>  include/drm/drm_dp_mst_helper.h               |  1 -
>  6 files changed, 15 insertions(+), 62 deletions(-)
> 
-- 
Cheers,
	Lyude Paul (she/her)
	Associate Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
