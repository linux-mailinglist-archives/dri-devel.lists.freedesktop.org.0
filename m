Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B80FD1F1DD4
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 18:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C14446E968;
	Mon,  8 Jun 2020 16:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F4C6E968
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 16:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591635136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CPoX45gxmjOqLoIv20XcIEcYRq/YssF2EgI5KSAc3xY=;
 b=S+9xfNqN5EnFMcA5DYY9SpPWlHudUByG/QWwg+oGIaNbTmDWAPJCRTZHxJlKeHrHXG7WHY
 h5STjA26XJSzXKCoLYnP8XxszSVjn7dMqiViS0d/IY5XxspQJADJ7tv7tjA1fRIGKcoOX+
 k6vpEmWChOo2qKgi805jQAkIEz4z8/A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-svhNfv0uPqysAzmo1_b8Nw-1; Mon, 08 Jun 2020 12:52:10 -0400
X-MC-Unique: svhNfv0uPqysAzmo1_b8Nw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F4EB8014D4;
 Mon,  8 Jun 2020 16:52:08 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-114-66.rdu2.redhat.com
 [10.10.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 11E88648DB;
 Mon,  8 Jun 2020 16:52:06 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <87ftb6x7em.fsf@intel.com>
References: <87ftb6x7em.fsf@intel.com>
 <2136072.1591491984@warthog.procyon.org.uk> <87o8puxak1.fsf@intel.com>
 <4ff2445aff8d44c5961a6d194a8f4663@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] A panic and a hang in the i915 drm driver
MIME-Version: 1.0
Content-ID: <2715544.1591635126.1@warthog.procyon.org.uk>
Date: Mon, 08 Jun 2020 17:52:06 +0100
Message-ID: <2715545.1591635126@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 dhowells@redhat.com, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "airlied@redhat.com" <airlied@redhat.com>,
 "Saarinen, Jani" <jani.saarinen@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jani Nikula <jani.nikula@linux.intel.com> wrote:

> David, please try [1].

Assuming you mean this:

    https://patchwork.freedesktop.org/patch/366958/?series=77635&rev=1

yes, that works.

Tested-by: David Howells <dhowells@redhat.com>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
