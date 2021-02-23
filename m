Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F30322EA5
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 17:23:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B53996E83A;
	Tue, 23 Feb 2021 16:23:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A6B6E83A;
 Tue, 23 Feb 2021 16:23:05 +0000 (UTC)
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N4h7p-1lvvos45KR-011img; Tue, 23 Feb 2021 17:22:50 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
 by mail.cetitecgmbh.com (Postfix) with ESMTP id BE0EC1E01E7;
 Tue, 23 Feb 2021 16:22:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
 by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com
 [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AmtucNZYzPf5; Tue, 23 Feb 2021 17:22:48 +0100 (CET)
Received: from pflmari.corp.cetitec.com (2-usr-pf-main.vpn.it.cetitec.com
 [10.8.5.2])
 by mail.cetitecgmbh.com (Postfix) with ESMTPSA id 7C2AB1E01E6;
 Tue, 23 Feb 2021 17:22:48 +0100 (CET)
Received: by pflmari.corp.cetitec.com (Postfix, from local account)
Date: Tue, 23 Feb 2021 17:22:48 +0100
From: Alex Riesen <alexander.riesen@cetitec.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH 2/3] drm/nouveau/kms/nv50-: Report max cursor size to
 userspace
Message-ID: <YDUr2OGDsxDyC0l2@pflmari>
References: <20210119015415.2511028-1-lyude@redhat.com>
 <20210119015415.2511028-2-lyude@redhat.com>
 <YDUN+Re/alMVL0Zn@pflmari>
 <CAKb7UvhFkw23so-a4JKLzpQLhphzjzarOy-9h+FiKP-aAC=4xw@mail.gmail.com>
 <YDUg/9fjsvTkRUqr@pflmari>
 <CAKb7Uvji_+N+b8HghZckU-uSBWn-=BZwNAiUff2oitbVuNUE2Q@mail.gmail.com>
 <YDUkfjDA4xLJlxE5@pflmari>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YDUkfjDA4xLJlxE5@pflmari>
X-Provags-ID: V03:K1:uxJfi3ydTk8ysbucSUV4XAHzr1MDK4K2Qpb1RjV23QE0dhbIwRa
 CoMudbULWew6HpAnY88BtTMf9aYScxJ/i21uWliY42ZIh9MQge9AJtKi4L3bixZruomkmGV
 o8DfWXw6AmzXny984pg2X3QVHXQu5WwVLAfmdj5jba2ozgNTg4vw5D3TzcWy6++m56G63C+
 VLD/cG3Jj+DrqseRsOuIQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NJUyY+qoh3U=:Oe5YbRyAdC5zUDEi1EEocZ
 /efMtL2j7n63uwuzI8AgdB3e7aNtq3OEBHsJOlW3q4/5sY49G8GgwNuoGIwNaAYa/4ggbk9Uy
 SSLcd0DMTQUiwZ8JuYwzToffnePVdVE2kSmndbnVgBl/1+uXIJP7/HxFEIstJbWmJCouIgITp
 80iBRQSHT49Nn24mOgaF+D80cKmws+nsmJgZYHCQnCwlHEWgzDMRpnVJaC+wjvGhii87JB0cQ
 DmTR+Lpmsx0XlsG5F2Zm+m5GqpwLmMuMD68pge+JVYgiti9HlE3Az0sOrlvjWkbPhGW+60dhw
 I36WLq9OkgUbByQUoDdMdhuedBX+7ntK7jnojiVmDVyMOIkYD/uxu8isYPJ7RDWwHt4pfLBw+
 3h4XO9uRKrwgf9WO5niAZ3QaASXQfbDhs1KSftPdU3UrGm6NDJJmOGLdUwug9VzV1wl7vt23c
 qzhb83zmGw==
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
Cc: David Airlie <airlied@linux.ie>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 James Jones <jajones@nvidia.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jeremy Cline <jcline@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau <nouveau@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Alex Riesen, Tue, Feb 23, 2021 16:51:26 +0100:
> Ilia Mirkin, Tue, Feb 23, 2021 16:46:52 +0100:
> > I'd recommend using xf86-video-nouveau in any case, but some distros
> 
> I would like try this out. Do you know how to force the xorg server to
> choose this driver instead of modesetting?

Found that myself (a Device section with Driver set to "nouveau"):

    $ xrandr  --listproviders
    Providers: number : 1
    Provider 0: id: 0x68 cap: 0x7, Source Output, Sink Output, Source Offload crtcs: 4 outputs: 5 associated providers: 0 name:nouveau

And yes, the cursor looks good in v5.11 even without reverting the commit.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
