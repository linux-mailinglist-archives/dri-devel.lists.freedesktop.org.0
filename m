Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78207621E10
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 21:53:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D26CE10E2BF;
	Tue,  8 Nov 2022 20:52:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 97102 seconds by postgrey-1.36 at gabe;
 Tue, 08 Nov 2022 20:52:53 UTC
Received: from mailrelay6-1.pub.mailoutpod2-cph3.one.com
 (mailrelay6-1.pub.mailoutpod2-cph3.one.com [46.30.211.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC20C10E2BF
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 20:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=lRQn8exuu7wnFZMI8IHVrMp2OrdlC19wf7uf4/8Vc2c=;
 b=ldG9YDuZ/4OJQK3CjWsAe5Xqah+JrqhoLVMiZhlBRTeq4XrjsE0JFYxxNSZlYGGtzQFgTfgUGlfvM
 EruBWCKoEtdyu9BwMlsoZptuiph5ytBVofcgh57+CJxgSE9JP4a/JOVW40f82/0HF0CU45FMH2OdzO
 HKxRD0S2Ii7ohX+JaiAtw0/vnQMXNGDPwdBSSUy0iBBuqI2jnnHdtGDkFmy0YCRqNGR/LlkFSQ5tOj
 qFOIfZLOYeJsy/WjwyPUiFiJ8OZSAlOkOERia914P3KaxDzOXgJ7k0QlQ6GGq3RlwIffM9LEjGr0fm
 Yru3pXdOo3brZ6jYuCTTrgZUwjbzIEA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=lRQn8exuu7wnFZMI8IHVrMp2OrdlC19wf7uf4/8Vc2c=;
 b=AXY5aY0fnOUP28QCvQM0D9Bhex2JaJZl5wB34jwSulPCVmvQhNupr6xXG4SfHBy05JqWcdMq+0/fC
 8lxJ8a+BA==
X-HalOne-ID: 287387d6-5fa7-11ed-80c9-a782043f7fe3
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay6 (Halon) with ESMTPSA
 id 287387d6-5fa7-11ed-80c9-a782043f7fe3;
 Tue, 08 Nov 2022 20:51:49 +0000 (UTC)
Date: Tue, 8 Nov 2022 21:51:47 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Ben Skeggs <bskeggs@redhat.com>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PULL] nouveau-next
Message-ID: <Y2rBYys5qiR0Vt2g@ravnborg.org>
References: <CABDvA==s+nZD0n7CuRWLPE=Pj+02CN13r+ZQJxoHQ_EmR+o=XQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABDvA==s+nZD0n7CuRWLPE=Pj+02CN13r+ZQJxoHQ_EmR+o=XQ@mail.gmail.com>
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
Cc: David Airlie <airlied@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas.

>       drm/nouveau/kms: switch to drm fbdev helpers

Noticed this little gem between all the other goodies in this pull
request. Just in case it is interesting and you missed it.

	Sam
