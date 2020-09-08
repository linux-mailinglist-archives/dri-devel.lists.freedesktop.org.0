Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A96260A55
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 07:50:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 163616E156;
	Tue,  8 Sep 2020 05:50:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F506E156
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 05:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599544200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hv6ahcmXPHg+20rdHp2NXPr6kpw5Az2FqrOEJWbBt2k=;
 b=jLuW1B1XayBzYtWEZyomNoRzxGMkpTuLtX2iQPU73frvpkzC0gvd0SGFLhpBhCnO2o3Thm
 41H4CP5Ie+TLPnyxt+zJF+Cp2nPmVRo5dmUqA3yI6XavYHiIeEkU58OhmPz88r5hwnhwGQ
 xzMTxY9672t2fgH1vxN0J1ptmSUD0r8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-Xk8mt8cENeiuK7MqIh44Wg-1; Tue, 08 Sep 2020 01:49:59 -0400
X-MC-Unique: Xk8mt8cENeiuK7MqIh44Wg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0486E800050;
 Tue,  8 Sep 2020 05:49:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 955A25C1C4;
 Tue,  8 Sep 2020 05:49:57 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1E26817538; Tue,  8 Sep 2020 07:49:56 +0200 (CEST)
Date: Tue, 8 Sep 2020 07:49:56 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH 03/13] drm/qxl: move bind/unbind/destroy to the driver
 function table.
Message-ID: <20200908054956.ucqoo566itzvu6td@sirius.home.kraxel.org>
References: <20200907204630.1406528-1-airlied@gmail.com>
 <20200907204630.1406528-4-airlied@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200907204630.1406528-4-airlied@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
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
Cc: sroland@vmware.com, bskeggs@redhat.com, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 08, 2020 at 06:46:20AM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> =

> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
