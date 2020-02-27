Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C382217158A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 11:59:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B6F6EC83;
	Thu, 27 Feb 2020 10:59:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060026EC83
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 10:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582801178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yBM9rsRMLHKC0vcSivcIADr6RnYJHWwqa3FpHeE/S0E=;
 b=FO6Q/OZ0XrVhMoMcZddtPtj/+rWowFdOD4uLUaIOjRT9ygrJ/S3l7xXf4mIO2fstkOkppZ
 wAF490x4ZDJvgoon1wbse9XYF3mBEczE4+UMu4c4kDnea9YTMOUlpHU/5At1SLr3FwUaZM
 nm93kvSqO7jf7YHIVrcUvt96HLG6wW8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-KRfD_-IMNJayCFJBYsxmzg-1; Thu, 27 Feb 2020 05:59:34 -0500
X-MC-Unique: KRfD_-IMNJayCFJBYsxmzg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAF311005512;
 Thu, 27 Feb 2020 10:59:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-150.ams2.redhat.com
 [10.36.116.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F5891BC6D;
 Thu, 27 Feb 2020 10:59:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A2E241744A; Thu, 27 Feb 2020 11:59:32 +0100 (CET)
Date: Thu, 27 Feb 2020 11:59:32 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [RFC PATCH 0/8] *** Refactor struct virtgpu_object ***
Message-ID: <20200227105932.udbbd42h2evuuwjk@sirius.home.kraxel.org>
References: <20200227002601.745-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200227002601.745-1-gurchetansingh@chromium.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: dri-devel@lists.freedesktop.org, jbates@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 26, 2020 at 04:25:53PM -0800, Gurchetan Singh wrote:
> The main motivation behind this is to have eventually have something like this:

patches 1+2 cherry-picked and pushed to -next.

thanks,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
