Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 343A987FA88
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 10:14:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632AE10F8DD;
	Tue, 19 Mar 2024 09:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bR5F1/qL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8BC010F8DD
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 09:14:44 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5529741"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; 
   d="scan'208";a="5529741"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 02:14:44 -0700
X-ExtLoopCount2: 2 from 10.237.72.74
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="827782081"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; d="scan'208";a="827782081"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 19 Mar 2024 02:14:42 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 19 Mar 2024 11:14:41 +0200
Resent-From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Resent-Date: Tue, 19 Mar 2024 11:14:41 +0200
Resent-Message-ID: <ZflXgefiO4VJGRtb@intel.com>
Resent-To: dri-devel@lists.freedesktop.org
X-Original-To: ville.syrjala@linux.intel.com
Delivered-To: ville.syrjala@linux.intel.com
Received: from linux.intel.com [10.54.29.200]
 by stinkbox.stink.local with IMAP (fetchmail-6.4.37)
 for <vsyrjala@localhost> (single-drop); Mon, 18 Mar 2024 22:49:06 +0200 (EET)
Received: from orviesa003.jf.intel.com (ORVIESA003.jf.intel.com
 [10.64.159.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id BE3C0580E3B;
 Mon, 18 Mar 2024 13:44:25 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="18315601"
Received: from fmvoesa102.fm.intel.com ([10.64.2.12])
 by ORVIESA003-1.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 13:44:26 -0700
X-IPAS-Result: =?us-ascii?q?A0E6AQCypvhlmLHS/INaHQEBAQEJARIBBQUBQIFPgjkZA?=
 =?us-ascii?q?YE4gQmEGjyIfIhuFp8xMxoBAQEBAQEBAQEJLhMBAgQBAQMEhH+IBQImOBMBA?=
 =?us-ascii?q?gQBAQEBAwIBAgEBAQEBAQgBAQECAgEBAQIBAQYDAQEBAQIQAQEBAQEBAQEeG?=
 =?us-ascii?q?QUQDieFLz0NgjclAYEeXgcJOAEBAQEBAQEBAQEBAQEBAQEBAQEBARQCDVsBA?=
 =?us-ascii?q?R4BAQEDAQEBCRcECwENAQEECikBAgMBAgYBAQgXBQIeBAQCAgMBUhkFgnuCY?=
 =?us-ascii?q?AMFl3CbOnp/M4EBggoBAQaxIIFhCYEaLogmAYRThGR6Jw+BVUR6UIMzgVKDB?=
 =?us-ascii?q?jiDDoJogUFWgzuFRRCMb4tySoEJHAOBBWsbEB43ERATDQMIbh0CMToDBQMEM?=
 =?us-ascii?q?goSDAsfBVQDQwZJCwMCGgUDAwSBLgUNGgIQLCYDAxJJAhAUAzgDAwYDCjEwV?=
 =?us-ascii?q?UEMUANkHxoYCTwLBAwaAhsUDSQjAiw+AwkKEAIWAx0WBDARCQsmAyoGNgISD?=
 =?us-ascii?q?AYGBl0gFgkEJQMIBAMQQgMgchEDBBoECwdSJoM/BBNEAxCBNIoig0IqgXeCR?=
 =?us-ascii?q?QMJAwcFLB1AAwsYDUgRLBYfFBsoHgFvB6UVKmSVdwGDIa8ENAeEFYFbBgyfO?=
 =?us-ascii?q?hozl1OSWy6YMah8gXsjAoFaMxojgzdSGQ+OIAwWg1iPe0E1AjkCBwEKAQEDC?=
 =?us-ascii?q?YVGAQGDWQGBRwEB?=
IronPort-PHdr: A9a23:+92u/R/xxQeu+f9uWQi4ngc9DxPPW53KNwIYoqAql6hJOvz6uci4b
 QqPur401wCBdL6YwswHotKViZyoYXYH75eFvSJKW713fDhBt/8rmRc9CtWOE0zxIa2iRSU7G
 MNfSA0tpCnjYgBaF8nkelLdvGC54yIMFRXjLwp1Ifn+FpLPg8it2O2+5Znebx9LiTe/br9+M
 Ru7oAfMvcQKnIVuLbo8xRTOrnZUYepawn9mK0yOlBjm/Mew+5Bj8yVUu/0/8sNLTLv3caclQ
 7FGFToqK2866tHluhnFVguP+2ATUn4KnRpSAgjK9w/1U5HsuSbnrOV92S2aPcrrTbAoXDmp8
 qlmRAP0hCoBKjU063/chNBug61HoRKhvx1/zJDSYIGJL/p1Y6fRccoHSWZdQspdUipMCZ6+Y
 YQSFeoMJeZWoZfjqlUToxWwBg6iC+HhyjBHmnD40rU63uYjHwzJwQAtEc4Cv2rPrNjuKKcfU
 vq4wLXSwDnfbf5b3yr25ojSchAmpPGBRb1/ccvVyUkrCQzOk0ieqIz/PzOXzOsNt3KU5PdnW
 OKxim4nrwVxrSa1ysc3iojJnIAVxUrA9Spj24s1Idy4SEhmYd+rCpdQtieaN5doTcMmWW1np
 CE6yrgftJO9YSMFx4gpyQTFZPybb4iH/AjjVOCJLDl3gH9rd7Gyigu9/0Wv1ODxWdW43UpFo
 CdFjtTCuHEA2Rzd5MWIVvZx4lms1CiB2g3d9uxJPEQ5mKvGJpMl3rI9kIcYv0fbHiLuhUn7g
 rKael869uWo9ejreKvqqoKAO4Nulw3zMKYjltSiDek8LAQCRXWX9OC/2bH54EH0QbtHgucrn
 qXEtp3RONoWpqqkAw9OzoYs9Qy/ASqn0NUZg3YKNE5JdRSahIbzIV7OOur3DfKnjlSsjjhrw
 /fGM6XuAprXNXfMjq3tfbhn60FC1gU80M5Q54lXCrEdJ/LzQlX9tNvCDh82KwC0wuDnB8th1
 o4GRG6CDLKVPLnMvVKI+O4jOfeAaJIJtDrnNvQo5fzjgWc8mVAHfKmp2ZUXaGq/HvRjO0iZY
 HzsgssfHmcOpwY+Q+LqiVKbXTFIYHayQqQ86S0lB4K9ForDQoGtgKed3CegBJFWaHpGBU6SH
 nj1aYqEQPQMaD6VIs95iDAEUqKhS4A52RGorwD106BnIfbM+i0EqZLj08B46/DQmB0q7zx7E
 9yd032RT2Fzhm4HXSI507p6oUBnz1eD0LN4gv1EGt1S/fxJURw3NZrdz+x8FtDzVRjNftaPS
 Fa6XNqmBSs9Qc42w98Le0p9Acmtjgjf3yq2BL8Yj6aEBJop/aLdxXTxPMZ9ynba1KkglFQmR
 spPNWu7hq9w7QTTBojJk1mHmKaub6gTwCnN9GKbwWqUoE5YSBJwUbnCXX0HZEvZt9L55kLYQ
 7+oCLQnMRZBycqYJaZRbt3pjFNGROrsOdjEYmKxnXuwCgiMxr+WcIXqfGAd0D3HCEcYiwAT4
 WqGNQ8mCyejuW3eCiFuFUnuYk/28ul+snK6T08vzwCLc01h0LS1+h8WhfGHT/MT37QEuDouq
 jluHVa92c7WBMSEpwZ7YKpcZtY97E9d1W3Frwx9IoCgL6d6i14cdAR3uEXu2A9sColalcglt
 nMqzBZzKaKezlxBcSiV3ZTxOr3RN2nz8wqja6/Q2lHCztmW/r0D5+g/q1XmpA2pDFYt82170
 9lJ1HuR/pbKAxATUZ7rTEY46Rh6p7TAbSk7+YzU02ZhMa21sj/ExtIoC/Epyhemf9dDLqyEE
 BX+HNEdB8ire6QXnUO0ZEcEIPxK7/xzeMenbOednqCxMetskSmlkWNfpodn3QWJ/it4T+fOm
 JEd3/Cf2BDAVjHggVPkvc7nyr1CfiwYS2+2yCz4A9xQYLF/ecMEB3frOcCu29hlm7bpWmVE7
 xitHV4L1MKyegaVdxr6
IronPort-Data: A9a23:xhbMf64iyxc28BKbqvsBzwxRtN7BchMFZxGqfqrLsTDasY5as4F+v
 mROCG+AP6zbZmGgf99xbIXk8x9TuZ/QyoBkG1E6/Cw3Eysa+MHILOrCEkqhZCn6wu8v7a5EA
 2fyTvGZdJhcoqr0/0/1WlTHhScijfngqp3UUbecY38ZqTdMEXtn01Q58wIAqtQAqcCjBA+Qs
 s/FrcTaOVu0sxZ5KWt8B5ir8XuDh9ys/mtH1rACTaoT5gOGzCBFVMh3yZyZdhMUfKEFRoZWe
 M6elNlVzkuBlz8xB9WslKrMc0FiatY+6iDV0hK684D76vRzjnRaPpQTbZLwWm8O49m9pO2d/
 f0W3XCGYVxwYvCTwrR1vy5wSEmSNYUekFPOzOPWXca7lyUqeFO1qxli4dpf0ST1NY+bDEkXn
 cH0JgzhYTiN18eT4KrgZdJ8g/Q6a8bRGb8hnkFvmGSx4fYOGfgvQo3F7NVVmjkqi81CEO3de
 80BLz11Y3wsYTUWYQ5RUs9k2r3x3j+mLGIwRFG9/cLb50DSyhB81P3iPsqQcNuXQ85YhW6cp
 3na5CL3GBwXONGEyiaC6jSrnOCncSbTAtlLSOfprKMCbFu7+U86EBtPWl2Ao6OUo0GMeYlnE
 1Ybw397xUQ13BX3EYisBnVUukWstxIVXpxVEvYo4xOEyYLQ4gCEFi4FSCJMbJots8pebTUs2
 l7PhNP4GT1HtLyTVGLb97GIoDf0Mi8QRUcAbCkFCw0E4MTnqak3jxTSXpBiFrK4ipv+HjSY6
 zKDqjUllfMQl9wazLen+l7GgBqop57UXkg04BnaWiSu6QYRTIyiYIqh8h7f5PZcLYCUSHGFv
 X4Zi46f6vwDCdeGkynlaOYEHfe36vaAOTvRh3ZrHp8853Ks/WKuecZb5zQWDERgN8cAPzzuZ
 k7eshFX9bdXPX23fel2ZZ68D4Ihyq2IPdHsX+rIY9wIZpF3dw+A5jpyTUqR2X391kkqjaw7f
 5ycdK6ECH8RCKlliiK/W+oZ2q06xQg6xGXOVdb6yQiq1fyVY3v9YbIMKlCPaKYz4bmCqRnS7
 NdUJeOOyhNCQKv/ZDXa9cgYKlViBX0yGIrx7cdXe+6KKCJiGWc8G7nQx68sf8pumKE9vuLJ9
 XG0V0tvxkfXgXzBNBXMa3Z/ZbepVpF6xVo+PC8le1W13GA7aIKmxKMecYYnO7gh6OFni/VzS
 pEtfcSaB/NeDDjO4BwZbJ/gvMpjcgimgUSFOC/NSCQ4epd7VUrM+8T4dxfH8CgIEzrxtM0ir
 rnm3QTeKbIfWR5+D8GQdei00lewu1AZmeRvTw3JJMVefAPn940CAzLwivs6ZdodMxfKwjKy0
 weQHAdepO/Rrotz+97M7YiWr4qvAvZhNk5bGXTLq7ewKSTeuGGkxOd9vP2gcjnXWSX64qiva
 ehOzO37KLsAhlkiX5dA/6hDw/Ibwvv3/JBh3gFUBTLEVXGXNJdQLSzTtSVQjZFlyrhcsAqwf
 0uA/NhGJLmEUP8J9nZMfGLJiczej5kpdinu0BgjHKntCMZKEFevXkxYMl+CkiFQILZuM58i2
 aEmosF+B+2DZvgCYo3uYsN8rjrkwpk8v0MP68ly7GjD11BD9726ScaAYhIaGbnWAzm2DmEkI
 yWPmI3JjKlGy0zJfhIbTCeUhbUN28tQ5E8SnTfuwmhlfPKY3pfbOzUMq1wKovh9lH2rLsotZ
 zUwaSWZ243Sol+Ee/Svr0j1R14QVUTxFr3Z01wTiGnQSUXgTXDEMGB1JOCM4k0D6GNAb1BmE
 EKwlg7YvcLRVJiphEMaABc9w9S6FIwZ3lOZwqiPQZ/ad6TWlBK42MdCk0JS9Uu+aS7w7WWaz
 dRXEBFYNfWgaXFP8vZjVeF3F904EXi5GYCLetk4lIshHGfAdTX00j+LQ31dsOsXTxAW2SdUw
 PCC6i6Cu9pSGcpOQv0m
IronPort-HdrOrdr: A9a23:oG6kBajrij7zqcCmtH6FyNBZlXBQXk0ji2hC6mlwRA09TyX5ra
 qTdTogpGTJYVEqKQMdcLG7Sdq9qBbnm6KdjrNhQItKNjOLhIKXFvAv0WKP+UyYJ8S6zJ8i6U
 +PG5IOQOEZIzBB/IzHCSODYqAdKODuytHiuQ81p00dAD2CEpsQpjuRaTzrYnGeJjM2eabRT6
 DskfavzgDIER95H6fLYQhiYwGAnay7qHvIW29IO/dN0nj1sdrH0s+DL/BYti1uJg+nho1Sk1
 QtlTaZhtTHwpWGI2fnphDuBxs/oqqU9jIvPqGxtvQ=
X-Talos-CUID: =?us-ascii?q?9a23=3A1cf9amlNMNFHdnJxUxke+Nxp7JzXOXON6VLwOxS?=
 =?us-ascii?q?XMnZseKTSRmW1xJ1Ao8U7zg=3D=3D?=
X-Talos-MUID: 9a23:QXjVCgQwxKrQzKpbRXTTpxh6Mp5n5Z+sUm0knqck4PG8LyNJbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="23142925"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="23142925"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from gabe.freedesktop.org ([131.252.210.177])
 by mtab.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 13:44:24 -0700
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
 by gabe.freedesktop.org (Postfix) with ESMTP id BD13C1120B2;
 Mon, 18 Mar 2024 20:44:23 +0000 (UTC)
X-Original-To: intel-gfx@lists.freedesktop.org
Delivered-To: intel-gfx@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E317E1120B2
 for <intel-gfx@lists.freedesktop.org>; Mon, 18 Mar 2024 20:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710794662; x=1742330662;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HZsgmxpn/d7I73aHkhjqcb9wJ8ucpOy6Wqvzh/mhEpU=;
 b=bR5F1/qLXL9zpkwSOT3xdUw5/V/I3RCgm/JFVDlFKrMaC80mzVOiNEXS
 YrEInu5lXymHB1ZoSkuc4NzRTMR+2yxgfOm2X0PXbOpUW3hDOecZQlf/t
 QWwp5z6nNfveAwfHj+pETexLutvXiKj+HRQxASRvaNS/YZv3xx5YjmfDM
 4AfFc7+vzphebhjDFAX93gxlB/UL5LRw5Cz8VCWKwr+cwzHCi2OpGQLtT
 VJJBBN16cIzM6CH6umiVlLF2QUUMHQvEenTOfKMcESX92zTGQsRbEs5dh
 FiC0hpACSslwlqPGjcTWABAsZBjEXcSY5Yn589tgCh0aAmoAoSYoN11RB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="16273739"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="16273739"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 13:44:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="827781926"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="827781926"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 18 Mar 2024 13:44:18 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 18 Mar 2024 22:44:17 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Simon Ser <contact@emersion.fr>,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Sameer Lattannavar <sameer.lattannavar@intel.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: [PATCH v3 2/2] drm/i915: Add SIZE_HINTS property for cursors
Date: Mon, 18 Mar 2024 22:44:08 +0200
Message-ID: <20240318204408.9687-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240318204408.9687-1-ville.syrjala@linux.intel.com>
References: <20240318204408.9687-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Advertize more suitable cursor sizes via the new SIZE_HINTS
plane property.

We can't really enumerate all supported cursor sizes on
the platforms where the cursor height can vary freely, so
for simplicity we'll just expose all square+POT sizes between
each platform's min and max cursor limits.

Depending on the platform this will give us one of three
results:
- 64x64,128x128,256x256,512x512
- 64x64,128x128,256x256
- 64x64

Cc: Simon Ser <contact@emersion.fr>
Cc: Jonas Ådahl <jadahl@redhat.com>
Cc: Daniel Stone <daniel@fooishbar.org>
Cc: Sameer Lattannavar <sameer.lattannavar@intel.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c | 24 +++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index f8b33999d43f..49e9b9be2235 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -823,6 +823,28 @@ static const struct drm_plane_funcs intel_cursor_plane_funcs = {
 	.format_mod_supported = intel_cursor_format_mod_supported,
 };
 
+static void intel_cursor_add_size_hints_property(struct intel_plane *plane)
+{
+	struct drm_i915_private *i915 = to_i915(plane->base.dev);
+	const struct drm_mode_config *config = &i915->drm.mode_config;
+	struct drm_plane_size_hint hints[4];
+	int size, max_size, num_hints = 0;
+
+	max_size = min(config->cursor_width, config->cursor_height);
+
+	/* for simplicity only enumerate the supported square+POT sizes */
+	for (size = 64; size <= max_size; size *= 2) {
+		if (drm_WARN_ON(&i915->drm, num_hints >= ARRAY_SIZE(hints)))
+			break;
+
+		hints[num_hints].width = size;
+		hints[num_hints].height = size;
+		num_hints++;
+	}
+
+	drm_plane_add_size_hints_property(&plane->base, hints, num_hints);
+}
+
 struct intel_plane *
 intel_cursor_plane_create(struct drm_i915_private *dev_priv,
 			  enum pipe pipe)
@@ -881,6 +903,8 @@ intel_cursor_plane_create(struct drm_i915_private *dev_priv,
 						   DRM_MODE_ROTATE_0 |
 						   DRM_MODE_ROTATE_180);
 
+	intel_cursor_add_size_hints_property(cursor);
+
 	zpos = DISPLAY_RUNTIME_INFO(dev_priv)->num_sprites[pipe] + 1;
 	drm_plane_create_zpos_immutable_property(&cursor->base, zpos);
 
-- 
2.43.2
