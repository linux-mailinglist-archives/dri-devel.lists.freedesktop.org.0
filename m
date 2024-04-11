Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8DC8A18DA
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 17:38:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9220F10F19A;
	Thu, 11 Apr 2024 15:37:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="XRBu+FT+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E8010F1A0;
 Thu, 11 Apr 2024 15:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=WE1dyOcRCkdDKHVQSE8grhwnH0jVKprFA2u7hDTWTaw=; 
 t=1712849867; x=1714059467; b=XRBu+FT+7gf4nXL527UYPu6pIDg8XI52N1uGTaJ+w3PRART
 pjGwhbT04snPvbFSIWFMgFYDftsjV4ZDVtXs1JnFo0zyt9Z/Dh5Yna78Sqzdu2LEKvjMSe8y9laZt
 Ru4zMpDlQ32UkQamSc0TcC64Y8Ax540ECNMnY8ynSJ+lQK8Y5vvqy2++kXk+LZOygYAXHSdNPD9v5
 8g/VA0oaxl4jPNxAKSXxM2jjHSIC+y6onW0jFv/QpK7fnUrKwYPb1b3pdpq5ase2/naPkWEJ5J37U
 Lff3ukg558oWQkYzWVBORSBJspFJ/2YbrDCZ1A+RnvY6nvY4iqefSbe+yigWuaJg==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97) (envelope-from <johannes@sipsolutions.net>)
 id 1ruwUh-00000002nXW-0s48; Thu, 11 Apr 2024 17:37:43 +0200
Message-ID: <d2a0cf345c7e049ffd76acd315e6b377d94a344c.camel@sipsolutions.net>
Subject: Re: [PATCH] treewide: Fix common grammar mistake "the the"
From: Johannes Berg <johannes@sipsolutions.net>
To: Thorsten Blum <thorsten.blum@toblux.com>, kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-s390@vger.kernel.org, speakup@linux-speakup.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-wireless@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-afs@lists.infradead.org, 
 ecryptfs@vger.kernel.org, netfs@lists.linux.dev,
 linux-fsdevel@vger.kernel.org,  linux-unionfs@vger.kernel.org,
 linux-arch@vger.kernel.org,  io-uring@vger.kernel.org, cocci@inria.fr,
 linux-perf-users@vger.kernel.org
Date: Thu, 11 Apr 2024 17:37:41 +0200
In-Reply-To: <20240411150437.496153-4-thorsten.blum@toblux.com>
References: <20240411150437.496153-4-thorsten.blum@toblux.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2024-04-11 at 17:04 +0200, Thorsten Blum wrote:
> Use `find . -type f -exec sed -i 's/\<the the\>/the/g' {} +` to find all
> occurrences of "the the" and replace them with a single "the".

I estimated that this misses at least ~50 instances split across lines:

$ git grep -ih -A1 -e 'the$'|grep -vi 'the$'|grep -E -- '^[^a-zA-Z0-9]*the =
'|wc -l
51

And a bunch that have more than one space:

$ git grep -E '\<the\s\s+the\>'|wc -l
20

So not sure you should claim "all" ;-)

johannes
