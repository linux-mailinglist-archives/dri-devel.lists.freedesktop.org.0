Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DE77726FB
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 16:04:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF18510E169;
	Mon,  7 Aug 2023 14:04:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9541510E169
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 14:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691417092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9gonXw8Bthkv4OpXNi3IXEgdbhncZcDDBc1BRZiVdPg=;
 b=P7+fRREYNjkUemgtfXnbsO1t/6PGWuN6N+Mv9LonYz+pSmsXRKRE4PNkQYZq6OO/5j7KZE
 wX/E3SkwQJsgoNBHHQVfvo9jZBJSicEmzIrClpO1BIlKUTlDdIE2zeW0h4lU8eKOt4vKq2
 6O0Vj3eq3PVztnP/l4Vb14HPYS80Qvw=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-r4ExLFTJNsuCPNISMQYZ0w-1; Mon, 07 Aug 2023 10:04:50 -0400
X-MC-Unique: r4ExLFTJNsuCPNISMQYZ0w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE2A43C14801;
 Mon,  7 Aug 2023 14:04:24 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.192.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9303440C7;
 Mon,  7 Aug 2023 14:04:22 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: tzimmermann@suse.de, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, ppaalanen@gmail.com,
 javierm@redhat.com
Subject: [PATCH 0/1] drm/fourcc: Add documentation about software color
 conversion.
Date: Mon,  7 Aug 2023 15:45:14 +0200
Message-ID: <20230807140317.26146-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There was some debate on IRC about software color conversion in DRM
drivers. I was not part of it, but one of my optimization for mgag200
might be affected. So I think it's better to document it clearly, so
that it's easier to know what is allowed or not.
I hope it reflects the actual consensus, and feel free to correct me
if I'm wrong, I may have missed some conversations.

Best regards,

Jocelyn Falempe (1):
  drm/fourcc: Add documentation about software color conversion.

 include/uapi/drm/drm_fourcc.h | 7 +++++++
 1 file changed, 7 insertions(+)


base-commit: 82d750e9d2f5d0594c8f7057ce59127e701af781
-- 
2.41.0

