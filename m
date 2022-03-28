Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DA94E9683
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 14:26:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C8910E648;
	Mon, 28 Mar 2022 12:26:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D9610E648
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 12:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648470373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iTjwmJF+3k+khwx6D8oLjFZKu5VissWtc8nbGOTpT9Q=;
 b=FQ9/u4VnDIrwCUYwlTGrDhVArRdIdjqL9A5NB2pIuxkRCcqo4tg2o9cpJAFRQwUK6lniSR
 AFd4Zajtff0SUWsZhtpMmdj9HGtd7YfawCORCQCEop39YOJ7LwbgS1O7wZWB+/h3NgJmqi
 S78sGBBWxMYSCsWQr9JkRlo7DI4/OP4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645--5RnXKeuOIybH1S_rZd2zA-1; Mon, 28 Mar 2022 08:26:09 -0400
X-MC-Unique: -5RnXKeuOIybH1S_rZd2zA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 303B3299E743;
 Mon, 28 Mar 2022 12:26:01 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A28697AC3;
 Mon, 28 Mar 2022 12:25:40 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <TYZPR01MB3935D1963BFD458E85412E4DF81B9@TYZPR01MB3935.apcprd01.prod.exchangelabs.com>
References: <TYZPR01MB3935D1963BFD458E85412E4DF81B9@TYZPR01MB3935.apcprd01.prod.exchangelabs.com>
To: kushagra765@outlook.com
Subject: Re: [ PATCH ] Documentation: fixed doc-build warnings
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2581030.1648470339.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Mar 2022 13:25:39 +0100
Message-ID: <2581031.1648470339@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
Cc: balbi@kernel.org, linux-usb@vger.kernel.org, arnd@arndb.de, corbet@lwn.net,
 airlied@linux.ie, gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, dhowells@redhat.com,
 mcgrof@kernel.org, linux-cachefs@redhat.com, viro@zeniv.linux.org.uk,
 tzimmermann@suse.de, akpm@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

kushagra765@outlook.com wrote:

> @@ -256,7 +256,6 @@ struct fscache_cookie *fscache_acquire_cookie(struct=
 fscache_volume *volume,
>  =

>  /**
>   * fscache_use_cookie - Request usage of cookie attached to an object
> - * @object: Object description
>   * @will_modify: If cache is expected to be modified locally
>   *
>   * Request usage of the cookie attached to an object.  The caller shoul=
d tell
> @@ -272,7 +271,6 @@ static inline void fscache_use_cookie(struct fscache=
_cookie *cookie,
>  =

>  /**
>   * fscache_unuse_cookie - Cease usage of cookie attached to an object
> - * @object: Object description
>   * @aux_data: Updated auxiliary data (or NULL)
>   * @object_size: Revised size of the object (or NULL)
>   *

Just deleting these lines is the wrong thing to do.  They should instead
mention the cookie parameter.

David

