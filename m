Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC2E579505
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 10:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93DD211A3A0;
	Tue, 19 Jul 2022 08:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D14811A37F;
 Tue, 19 Jul 2022 08:11:41 +0000 (UTC)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
 (envelope-from <dri-devel-bounces@lists.sourceforge.net>)
 id 1oDiKR-0007ph-DY; Tue, 19 Jul 2022 08:11:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <airlied@gmail.com>) id 1oDb7v-0002gB-LA
 for dri-devel@lists.sourceforge.net; Tue, 19 Jul 2022 00:30:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tHECUp5Nu2/GZmp47KHS0DA3aZn/HqPLp4AXTv+D1so=; b=P9QiOZDeK104mb+7yhPvEeYU5q
 iBUVP932VignPdMqVi25uKlrMMdtCxJS0nTzF6Gq1FZVFPUMPof2GhXlPpKRCneb50XLgvESPfnOy
 jIODY/KtSbidGRJQ9n8UwWBkOaJc9pLEjgbNU3JhAFBXcQTCuqUXlFU9e6b8xv3t2SNw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tHECUp5Nu2/GZmp47KHS0DA3aZn/HqPLp4AXTv+D1so=; b=eWQeS69iplpRzrZEQBdYjv0+PK
 gyPvHXmBWSwxNkCviQolv2p2wgzGW3ggr57JvcG3MsAdAMus2nO2wZadAnhMWyx6Dg8CpsMXj8vg0
 BjChFjYuOeHffTm68GMobELU8viaGtuGqL7tS/jIUjNDiz+jrJhZhMK7kINU9la3jyak=;
Received: from mail-ej1-f49.google.com ([209.85.218.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1oDb7u-0005P5-EN
 for dri-devel@lists.sourceforge.net; Tue, 19 Jul 2022 00:30:14 +0000
Received: by mail-ej1-f49.google.com with SMTP id fy29so23179149ejc.12
 for <dri-devel@lists.sf.net>; Mon, 18 Jul 2022 17:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112; 
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tHECUp5Nu2/GZmp47KHS0DA3aZn/HqPLp4AXTv+D1so=;
 b=cmjJp4Wc70UFyJOU6m9PHDv6cgBcSxACjV8XCYXocWtr/FcDcZs/QFmdPSXbhLyk3R
 FCPJlVcDF3a/bfbY1OWEBMjl7TtYtUqMl4/A/cUcxiW5hsr+PAuT1lF+4Ixp22UZhHaL
 sJIUDawrTaLiqBcojVG2hn0PPXAFrYn7zche+uxAV4J2eoaR53m7JLz9lb0PPCkXovqr
 TCkGxZqKxLlK4CUnskdjqrd6D8nX5LutfIhmOojrYGQhrbAL0nFeOJB3HSXXDc75ja4Q
 Ur9wiz3Bf1hLJs4caVo1AfyVNX5xpE4+6LBYPFFX8y4zfXhOa+ndM9cAVlVQj/YWQdYx
 EP1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tHECUp5Nu2/GZmp47KHS0DA3aZn/HqPLp4AXTv+D1so=;
 b=e48GYZxwu13ZxdhGgSArJuvEj2wx4MWXIFh5VQQIZPKfJO1aUCoaPkJ7gkdxFPb02I
 9Onbkq0BlRlwutXI2Jwqkvt6S54RNp5jtpDkdbbykBHXtqVP76SAUyuuon3lLX+IEWip
 2L0qTX8zJwN5i76JJsUYmtmU38eG3O3eILK8OCLZYJzvepyuSjkKyW/Ue0b+K26BaZhJ
 fYRTI3YivSK64c486GEIVwjq2gw/4EqdM4p6O1JJ+KMQRqZ/RNrqOxgRLKw3GmwhBB03
 wjZlutUdoHA20BDhGaqF1fwoD4bnY0Tb7OFtwVDafreT/cSR9z8ijGVaKo0NabmRGyHW
 zenw==
X-Gm-Message-State: AJIora+9EA84Ecrf+8jGsScagsRJI4bOEfABUTZYLL000ztn59MRAjuR
 k5O625+7lkh29ruET/rh82XbtUlEh2tdI+8xvbE=
X-Google-Smtp-Source: AGRyM1svWNwoYq60pp37EFhGkxbFoEzaD37OWwpIsvtcVPSeTlz8BczIXRa0zpFaHGe5N9WvcJ4GnRQwW7CTE2lGvM0=
X-Received: by 2002:a17:907:96ac:b0:72f:1dea:5b66 with SMTP id
 hd44-20020a17090796ac00b0072f1dea5b66mr10887738ejc.266.1658190608048; Mon, 18
 Jul 2022 17:30:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220718072144.2699487-1-airlied@gmail.com>
 <YtWeUOJewho7p/vM@intel.com>
In-Reply-To: <YtWeUOJewho7p/vM@intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 19 Jul 2022 10:29:56 +1000
Message-ID: <CAPM=9tyhOfOz1tn7uNsg_0EzvrBHcSoY+8bignNb2zfgZr6iRw@mail.gmail.com>
Subject: Re: [PATCH] docs: driver-api: firmware: add driver firmware
 guidelines.
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: > > +* Firmware should be versioned with at least a
 major/minor
 version. It > > + is suggested that the firmware files in linux-firmware
 be named with > > + some device specific name, and just the maj [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.49 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.49 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [airlied[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oDb7u-0005P5-EN
X-Mailman-Approved-At: Tue, 19 Jul 2022 08:11:34 +0000
X-BeenThere: dri-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-BeenThere: dri-devel@lists.freedesktop.org
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Linux Wireless List <linux-wireless@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-block@vger.kernel.org,
 "Luis R. Rodriguez" <mcgrof@kernel.org>,
 Network Development <netdev@vger.kernel.org>,
 "dri-devel@lists.sf.net" <dri-devel@lists.sf.net>,
 Dave Airlie <airlied@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > +* Firmware should be versioned with at least a major/minor version. It
> > +  is suggested that the firmware files in linux-firmware be named with
> > +  some device specific name, and just the major version. The
> > +  major/minor/patch versions should be stored in a header in the
> > +  firmware file for the driver to detect any non-ABI fixes/issues. The
> > +  firmware files in linux-firmware should be overwritten with the newest
> > +  compatible major version. Newer major version firmware should remain
> > +  compatible with all kernels that load that major number.
>
> would symbolic links be acceptable in the linux-firmware.git where
> the <fmw>_<major>.bin is a sym link to <fwm>_<major>.<minor>.bin
>
> or having the <fwm>_<major>.bin really to be the overwritten every minor
> update?

I don't think providing multiple minor versions of fw in
linux-firmware is that interesting.
Like if the major is the same, surely you always want the newer ones.
As long as the
ABI doesn't break. Otherwise we are just wasting disk space with fws
nobody will be using.

Dave.


--
_______________________________________________
Dri-devel mailing list
Dri-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/dri-devel
