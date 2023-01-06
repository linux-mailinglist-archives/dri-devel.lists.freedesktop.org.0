Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E0A65FD31
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 09:56:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B54EE10E847;
	Fri,  6 Jan 2023 08:56:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD9E810E02D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 08:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672995405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uLbTtBhLbT16cQn5JaFZSqF6UC/WTEnjXuJo5ciZ+Bw=;
 b=Xzr0h4IJAVkctZH7kpPwUvjIiVhMHmW61FQVReRoiwFhLo1B9SJLmtbdTz1mP2etFkUV0S
 eCrOSFQ+N/Fd9mgNrPpVWNTWUrp6udLiSTGeQznJluLrjmvaiihI2O2fQjFTYw4lhMp1Km
 5n9LJd4cVCD+xteixBxlZaHzBxx1k5w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-424-ZXaaOFeEO6aioY4gHBYrgQ-1; Fri, 06 Jan 2023 03:56:42 -0500
X-MC-Unique: ZXaaOFeEO6aioY4gHBYrgQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E2413C14104;
 Fri,  6 Jan 2023 08:56:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.238])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD64A40C2064;
 Fri,  6 Jan 2023 08:56:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 207061800081; Fri,  6 Jan 2023 09:56:40 +0100 (CET)
Date: Fri, 6 Jan 2023 09:56:40 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v1 2/2] drm/virtio: Add the hotplug_mode_update property
 for rescanning of modes
Message-ID: <20230106085640.54hvmhblmh4o2jxb@sirius.home.kraxel.org>
References: <20221118013054.182304-1-vivek.kasireddy@intel.com>
 <20221118013054.182304-3-vivek.kasireddy@intel.com>
MIME-Version: 1.0
In-Reply-To: <20221118013054.182304-3-vivek.kasireddy@intel.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
Cc: Dongwon Kim <dongwon.kim@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 17, 2022 at 05:30:54PM -0800, Vivek Kasireddy wrote:
> Setting this property will allow the userspace to look for new modes or
> position info when a hotplug event occurs.

This works just fine for modes today.

I assume this is this need to have userspace also check for position
info updates added by patch #1)?

take care,
  Gerd

