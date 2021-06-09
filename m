Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2263A0C37
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 08:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 309516E0BA;
	Wed,  9 Jun 2021 06:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7E396E0BA
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 06:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623219069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RlOZ7CMc5zH0BOdeAnl94vt2DHlXfnGql9Hvv6rQJqk=;
 b=Ij3BD1LiBdA1/3Wtr1MUAZtNXKPRm9NZGkClj75uaSZkVzx9mUPyJtEwb+wHNV3Qopmn6U
 Ll19SppdoZ2he8iIDbby7TovJQzBVButzFk2NQFjRKBBWf285K8uGvhZDN8yjeIXT8i4Oj
 AVmvSYgcCBald/rLsGDZp/zcLDitGVc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-JTCjQqNxMgGH0iuLh2vzjA-1; Wed, 09 Jun 2021 02:11:07 -0400
X-MC-Unique: JTCjQqNxMgGH0iuLh2vzjA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68DB21850606;
 Wed,  9 Jun 2021 06:11:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-69.ams2.redhat.com
 [10.36.113.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E153F19CA8;
 Wed,  9 Jun 2021 06:11:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 51EAF18003B6; Wed,  9 Jun 2021 08:11:04 +0200 (CEST)
Date: Wed, 9 Jun 2021 08:11:04 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dongwon Kim <dongwon.kim@intel.com>
Subject: Re: [PATCH] udmabuf: Add support for mapping hugepages (v3)
Message-ID: <20210609061104.g5kq6x47vbbftbyh@sirius.home.kraxel.org>
References: <20210604055903.g2bp4vuay2555omg@sirius.home.kraxel.org>
 <20210604205939.376598-1-vivek.kasireddy@intel.com>
 <20210608173558.GB432@dongwonk-MOBL.amr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <20210608173558.GB432@dongwonk-MOBL.amr.corp.intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 08, 2021 at 10:35:58AM -0700, Dongwon Kim wrote:
> I see the number of entries in the list often exceeds list_limit
> currently hardcoded to 1024 for full HD scanout resource (==
> 1920*1080*4 bytes). Can we include a change to increase it to something
> like 4096 or higher in this patch?

Separate patch please (and maybe turn limits into module parameters
while being at it).

take care,
  Gerd

