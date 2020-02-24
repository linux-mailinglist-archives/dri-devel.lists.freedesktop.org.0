Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9782E169FB2
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 09:01:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F7D6E181;
	Mon, 24 Feb 2020 08:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E19026E181
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 08:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582531308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y3k7CBfM/Hm5OZkVahFQ48Ui09Bfe7QN12s5LneLIq8=;
 b=GKX9KHzB4cHmbUvJ9aZksyw2URqGkO83IsLe2mDMhR2BTSR7Ead8jQb8x2xOBpLq3Hs7gs
 oltLQEL7azwH2+1/Zq5J8BP0d5r2RwYQAAXiYn49epei2ekXZU/egZZvCsTJyX/HpMDNkN
 q1sM/cwLsgZGxjgu/fyjArFjxPBJIsE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-ULQt_oS7MnWE17tkSC_Q_Q-1; Mon, 24 Feb 2020 03:01:46 -0500
X-MC-Unique: ULQt_oS7MnWE17tkSC_Q_Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40065800D5A;
 Mon, 24 Feb 2020 08:01:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-87.ams2.redhat.com
 [10.36.116.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE59E85781;
 Mon, 24 Feb 2020 08:01:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0A99C1747F; Mon, 24 Feb 2020 09:01:43 +0100 (CET)
Date: Mon, 24 Feb 2020 09:01:43 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Nirmoy Das <nirmoy.aiemd@gmail.com>
Subject: Re: [PATCH 7/8] drm/bochs: use drm_gem_vram_offset to get bo offset
Message-ID: <20200224080143.5uxfymhs3uwvcvba@sirius.home.kraxel.org>
References: <20200217150427.49994-1-nirmoy.das@amd.com>
 <20200217150427.49994-8-nirmoy.das@amd.com>
MIME-Version: 1.0
In-Reply-To: <20200217150427.49994-8-nirmoy.das@amd.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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
Cc: thellstrom@vmware.com, amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 kenny.ho@amd.com, brian.welty@intel.com, dri-devel@lists.freedesktop.org,
 nirmoy.das@amd.com, linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 alexander.deucher@amd.com, sean@poorly.run, christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 17, 2020 at 04:04:26PM +0100, Nirmoy Das wrote:
> Switch over to GEM VRAM's implementation to retrieve bo->offset
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
