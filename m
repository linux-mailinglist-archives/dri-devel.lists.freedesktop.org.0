Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B593105F6
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 08:40:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 119D36F3EB;
	Fri,  5 Feb 2021 07:40:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D70AA6F3EB
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 07:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612510804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZrmnAR/vWjWkSNr5ECzQmom8EeDZlq5336FM1xHEIxE=;
 b=BUJipfJnDM+NlRqSSWE/vv/Bxy1PWxNuR6leLvjhBBdJrM/aKbDR8fCRPJtkEe/VQLjF3h
 2KvWQ/qt5dIxt2POJT/+NYoc3/leq4xx8Wew7DMnmQTwI6TBoNJYoBpk15szgsfs60cmWC
 j9eU0f+0VZjH8G/A0CfNgzhAyTKPAA4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-JPRvEA61PgCvKQRcC8jDmw-1; Fri, 05 Feb 2021 02:40:00 -0500
X-MC-Unique: JPRvEA61PgCvKQRcC8jDmw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B21A5192AB79;
 Fri,  5 Feb 2021 07:39:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-108.ams2.redhat.com
 [10.36.113.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 43F0C62679;
 Fri,  5 Feb 2021 07:39:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9947318000B6; Fri,  5 Feb 2021 08:39:56 +0100 (CET)
Date: Fri, 5 Feb 2021 08:39:56 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH v6 01/10] [hack] silence ttm fini WARNING
Message-ID: <20210205073956.koeqlzh2suuzitgr@sirius.home.kraxel.org>
References: <20210204145712.1531203-1-kraxel@redhat.com>
 <20210204145712.1531203-2-kraxel@redhat.com>
 <1bb54d72-a9b5-0d9d-6f08-b8f9f4abe421@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1bb54d72-a9b5-0d9d-6f08-b8f9f4abe421@amd.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: David Airlie <airlied@linux.ie>, Huang Rui <ray.huang@amd.com>,
 dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 04, 2021 at 03:58:33PM +0100, Christian K=F6nig wrote:
> ?
> =

> What's the background here?
> =

> Christian.
> =

> Am 04.02.21 um 15:57 schrieb Gerd Hoffmann:
> > kobject: '(null)' ((____ptrval____)): is not initialized, yet kobject_p=
ut() is being called.
> > WARNING: CPU: 0 PID: 209 at lib/kobject.c:750 kobject_put+0x3a/0x60
> > [ ... ]
> > Call Trace:
> >   ttm_device_fini+0x133/0x1b0 [ttm]
> >   qxl_ttm_fini+0x2f/0x40 [qxl]

Happens on driver removal.  Seen with both qxl and bochs (the later
using vram helpers).

Testcase: "drmtest --unbind" (https://git.kraxel.org/cgit/drminfo/).

static int try_unbind(int card)
{
    char path[256];
    char *device, *name;
    int fd;

    snprintf(path, sizeof(path), "/sys/class/drm/card%d/device", card);
    device =3D realpath(path, NULL);
    if (device =3D=3D NULL) {
        fprintf(stderr, "%s: can't resolve sysfs device path\n", __func__);
        return -1;
    }

    snprintf(path, sizeof(path), "%s/driver/unbind", device);
    fd =3D open(path, O_WRONLY);
    if (fd < 0) {
        fprintf(stderr, "open %s: %s\n", path, strerror(errno));
        return -1;
    }

    name =3D strrchr(device, '/') + 1;
    write(fd, name, strlen(name));
    close(fd);
    return 0;
}

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
