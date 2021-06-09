Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1453A0CD4
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 08:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB9F6E071;
	Wed,  9 Jun 2021 06:56:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFBA86E071
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 06:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623221805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eLt5HNh7vHEJNm0FOJCuopbWQZpTlqG9hnhRMri1AL0=;
 b=E8yaDc9/I9Y120i+lvgQm/u/FUdqT25eiw2k40ymy//Ctie0Ffsn9VwsVDFQXXNByTo0Sm
 Q/kiIK8xUIZ8PCGmlClf5oSjhhWDcACRzfmVtf02LmxKTcMWyMdQQSa6puXo/61uibjmHN
 GlSX4Zi3K/05v9vqVR2WBVa/5etPTHc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-DDb5AA37MkqBmRQd_yHr1A-1; Wed, 09 Jun 2021 02:56:42 -0400
X-MC-Unique: DDb5AA37MkqBmRQd_yHr1A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E01295121;
 Wed,  9 Jun 2021 06:56:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-69.ams2.redhat.com
 [10.36.113.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A6B015D719;
 Wed,  9 Jun 2021 06:56:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2BC8518003B6; Wed,  9 Jun 2021 08:56:40 +0200 (CEST)
Date: Wed, 9 Jun 2021 08:56:40 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH] udmabuf: Add support for mapping hugepages (v3)
Message-ID: <20210609065640.an5vxoup7yesenwb@sirius.home.kraxel.org>
References: <20210604055903.g2bp4vuay2555omg@sirius.home.kraxel.org>
 <20210604205939.376598-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210604205939.376598-1-vivek.kasireddy@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Dongwon Kim <dongwon.kim@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> +					hpage = find_get_page_flags(

checkpatch doesn't like that:

-:76: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('

> +				page = shmem_read_mapping_page(

Same here.

take care,
  Gerd

