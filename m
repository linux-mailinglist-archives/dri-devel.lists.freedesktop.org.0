Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F7C87FA8E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 10:15:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A51BD10F8D9;
	Tue, 19 Mar 2024 09:15:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KqUEhUr1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A727B10F8D9
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 09:14:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5529761"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; 
   d="scan'208";a="5529761"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 02:14:55 -0700
X-ExtLoopCount2: 2 from 10.237.72.74
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="827782085"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; d="scan'208";a="827782085"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 19 Mar 2024 02:14:53 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 19 Mar 2024 11:14:52 +0200
Resent-From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Resent-Date: Tue, 19 Mar 2024 11:14:52 +0200
Resent-Message-ID: <ZflXjNSZ7jWN4tRy@intel.com>
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
 by linux.intel.com (Postfix) with ESMTPS id EAF64580D4E;
 Mon, 18 Mar 2024 13:44:21 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="18315593"
Received: from fmvoesa102.fm.intel.com ([10.64.2.12])
 by ORVIESA003-1.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 13:44:22 -0700
X-IPAS-Result: =?us-ascii?q?A0ELAACypvhlmLHS/INaHAEBAQEBAQcBARIBAQQEAQFAg?=
 =?us-ascii?q?TsHAQELAYI4GQFiVoEJhBo8iB1fiGsDFplrhAaBQDUYAQEBAQEBAQEBCS4LC?=
 =?us-ascii?q?AECBAEBAwSEf4gFAiY0CQ0BAQIEAQEBAQMCAQIBAQEBAQEIAQEBAgIBAQECA?=
 =?us-ascii?q?QEGAwEBAQECEAEBAQEBAQEBHhkFEA4nhS89DYI3JQGBHl4HCTgBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBAQEUAg1bAQEeAQEBAwEBAQkXBAsBDQEBBAopAQIDAQIGA?=
 =?us-ascii?q?QEIFwUCHgQEAgIDAVIZBYJ7AYJfAwUMl2SbOnp/M4EBggoBAQaxIIFhAwaBG?=
 =?us-ascii?q?i4BiCUBhFOEZHonD4FVRHpQgQZtSnaBUoJIAQozg0aCaIIXgmAyKYVFEIQgh?=
 =?us-ascii?q?HiDV4UNgUuFGkqBCRwDgQVrGxAeNxEQEw0DCG4dAjE6AwUDBDIKEgwLHwVUA?=
 =?us-ascii?q?0MGSQsDAhoFAwMEgS4FDRoCECwmAwMSSQIQFAM4AwMGAwoxMFVBDFADZB8aG?=
 =?us-ascii?q?Ak8DwwaAhsUDSQjAiw+AwkKEAIWAx0WBDARCQsmAyoGNgISDAYGBl0gFgkEJ?=
 =?us-ascii?q?QMIBAMQQgMgchEDBBoECwdSJoM/BBNEAxCBNIoig0IqgXeCRQMJAwcFLB1AA?=
 =?us-ascii?q?wsYDUgRLBYfFBsoHgFvB6I5AYIVPwcqEyQuCgkYBEsBNV8HKSmTDgGDIa8EN?=
 =?us-ascii?q?AeEFYFbBgyKHZUdGjOEBZNOklsumDGCU4ckg3mbDIFkOgKBWjMaI1CCZ1IZD?=
 =?us-ascii?q?44gg3qFFIpnQTUCOQIHAQoBAQMJhUYBAYMmAScLAYFHAQE?=
IronPort-PHdr: A9a23:1DHgtBee3dV0SyhtmTGAbW6ylGM+vNrLVj580XLHo4xHfqnrxZn+J
 kuXvawr0AWYG9WEoKsf1KL/iOPJZy8p2dW7jDg6aptCVhsI2409vjcLJ4q7M3D9N+PgdCcgH
 c5PBxdP9nC/NlVJSo6lPwWB6nK94iQPFRrhKAF7Ovr6GpLIj8Swyuu+54Dfbx9HiTajZb5+N
 ha7oAfeusULj4ZvKLs6xwfUrHdPZ+lZymRkKE6JkRr7+sm+4oNo/T5Ku/Im+c5AUKH6cLo9Q
 LdFEjkoMH076dPyuxXbQgSB+nUTUmMNkhpVGAfF9w31Xo3wsiThqOVw3jSRMNDsQrA1XTSi6
 LprSAPthSwaOTM17H3bh8pth69AvhmvuwJwzJLVYIGNNfpxYKXdfc8BRWFcWspdTjFNDp+gY
 4cKCecKIORWoJTnp1YWrRWwGxehCv7hxDFLgXH536M63Os9Hg/JxAwtHdAAvXvJoNj7KKsdT
 /u1wbLUzTjAdf5axS3w5JTKfx0nvPqCXahwcc3UyUQ3GAzFj1GQqYj7MDiIy+oMs3Kb7+h6W
 uKrkWEstgZ8oiauxscojonGmJgZykvE9CVjwoY6P9m4R1RgbN6gEZtQsTyaNoRsTsMjRWFop
 Dg1yrkctZGneygKzY0qyhjCYPOIb4aG+AjsVPqNIThmnnJlfqqyiwux/EWjyODxSse63VRFo
 CdZktTBtnEA2hjc58WaSPZw/Eis1SiB2g7d9+1IPF05mKnFJpI937M+mZ4evFrMEyLwhU74g
 qiWdkA+9eip7eTqerrmppmbN49xlA7yKKMumtawAek+LwMAXHCb9Pyh2LDt4EH1WqtGg/0on
 qXDrpzWONgXqrSkDwJX0Isv8wuzAjO43NgCgHUKKFFIdAiag4XoNVzCOu30Aeq5jl+xjjprw
 +3GPqb9AprTNHjNjbbhfLdj5ENE1AY+y81U6YhOBbEbOv3zX1f8tNzGAR89NAy52+nnB89m2
 YwAQ26PDLWZP73MvlCV+O0vOOqMZJMSuDblMfQl4OTujXAhlV8ce6mmw4cXZWilEvloPkmVe
 2Tgj9cfHWsQoAYyUfDmhEefXTNRZXu+R6c86Ss6CIKiA4fDXIetgLmZ0Se6GJ1Wen5JClSVH
 XfneYWFVO4AZzmVIs98lDwLSaauS5Q62BGqtQ/60KZnLvHO9i0Wr5LsysZ66PDNmhEp9jx0E
 8Od03mXQ2FzhGMISCc63KZkrkNl0FeMzbB4g+BEFdxU//5FTwQ3OYbGz+NmE9DyRh7BftCRR
 Vm8X9qpGzQxQsg0w98PeEZ8GsmtjxHZ0CqpGLIVk72LBJop8qPTxXTxJsB9y2rY26kllVUpX
 sxPNWi+iq5l6wfTH5LJk1mel6uyb6sc2jPC9GaZwWqVvEFZUBJwUaTeUHAbZ0vWq8n550zYQ
 7+vD7QnLhVOycqYJqRWbd3piE1KRO3/N9TGf2Kxh2CwCA6KxryWaorqen8R3CPcCEgHjgAT+
 WyJOBM6BiegpWLeETNvGUjuY0Pq7elxtne7QlUowAGNak1tz6C19QINhfyAV/MT2aoJuCU7p
 DVyAVa9xNPXB8CDpwp7faRdYcg94VZb1WLeuQx9P5+gIrtmhl4fdQR3okzv2w92CoVGjcgls
 ncqwBBuJqKf1VNNbymY0ozoOr3LNmny+wiia6zR2lHZ1taZ4LwP5O48q1r5vAGpCksi83N53
 NlTyHac4pTKDAwPUZP+SEo39h56p63EbSk5/Y/byXpsMaysvj/Yx90pHPclygqnf9pHM6OLD
 g7yH9cEB8ewKOwqnkKmbhQaM+BU76M0O8Kmd/2b2K+kJupgnTSmjXhZ74B5yE6D6y18Suubl
 6sD2OySiwubSy/n3hDmtsHshZsCaysfE2ay0iv4A5YXYbd9OoMCCGOrKsvwwc1ihpnrQDlZ8
 kKuAxYJ1t/6RByJclao
IronPort-Data: A9a23:m4G5PK52kPEiqjlxmMMuBwxRtN7BchMFZxGqfqrLsTDasY5as4F+v
 jEbX2iPMveCYTahLYsiPY+yoB8OsMLQn9AyTldu/3tmEysa+MHILOrCEkqhZCn6wu8v7a5EA
 2fyTvGZdJhcoqr0/0/1WlTHhScijfngqp3UUbecY38ZqTdMEXtn01Q58wIAqtQAqcCjBA+Qs
 s/FrcTaOVu0sxZ5KWt8B5ir8XuDh9ys/mtH1rACTaoT5gOGzCBFVMh3yZyZdhMUfKEFRoZWe
 M6elNlVzkuBlz8xB9WslKrMc0FiatY+6iDV0hK684D76vRzjnRaPpQTbZLwWm8O49m9pO2d/
 f0W3XCGYVxwYvCTwrR1vy5wSEmSNYUekFPOzOPWXca7lyUqeFO1qxli4dpf0ST1NY+bDEkXn
 cH0JgzhYTicqOO00eKhadJHocUbdcnEH74Nh39JmGSx4fYOGfgvQo3F7NVVmjkqi81CEO3de
 80BLz11Y3wsYTUWYQ5RUs9k2r3x3j+mLGIwRFG9/cLb50DSyhB81P3iPsqQcNuXQ85YhW6cp
 3na5CL3GBwXONGEyiaC6jSrnOCncSbTAtlLSOfpr68CbFu72zwTAxkQfAOC5vSo1BGuQu5bJ
 HNFw397xUQ13BX3EYisBnVUukWstxIVXpxVEvYo4xOEyYLQ4gCEFi4FSCJMbJots8pebTUs2
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
 ehOzO37KLsAhlkiX5dA/6hD0o0/5cq/vZxh5SNlJCzLQHeWGI5uCyzTtSVQjZFlyrhcsAqwf
 0uA/NhGJLmEUP8J9nZMfGLJiczej5kpdinu0BgjHKntCMZKEFevXkxYMl+CkiFQILZuM58i2
 aEmosF+B+2DZvgCYo3uYsN8rjrkwpk8v0MP68ly7GjD11BD9726ScaAYhIaGbnWAzm2DmEkI
 yWPmI3JjKlGy0zJfhIbTCeUhbUN28tQ5E8SnTfuwmhlfPKY3pfbOzUMq1wKovh9lH2rLsotZ
 zUwaSWZ243Sol+Ee/Svr0j1R14QVUTxFr3Z01wTiGnQSUXgTXDEMGB1JOCM4k0D6GNAb1BmE
 EKwlg7YvcLRVJiphEMaABc9w9S6FIwZ3lOZwqiPQZ/ad6TWlBK42MdCk0JS9Uu+aS7w7WWaz
 dRXEBFYNfWgaXFP8vZjVeF3F904EXi5GYCLetk4lIshHGfAdTX00j+LQ31dsOsUTxAW2SdUw
 PCC6i6Cu9pSGcpOQv0m
IronPort-HdrOrdr: A9a23:bJBpua3yIPv98IDH6hmT0gqjBCUkLtp133Aq2lEZdPU0SKalfg
 6V7Y8mPHjP+UQssRAb6KO90cy7L080mqQFnLX5V43PYODZghrlEGgP1/qa/9SkIVyBygayvZ
 0QO5SXJrXLfBJHZOzBkX+F++9J+qjNzEhD7d2ugkuFNDsaIp2IjD0JejpzcHcGODWuXqBJY6
 Z0j/Avz1HOCBdnCbXcOpBGZZmzmzTlruOoXfdsPW9c1ODht0LR1FY6eyLoqyv2FAk/o4vK91
 Kl832dl8GeWomAu2DhP+C61eUjpDKN8LZ+OPA=
X-Talos-CUID: =?us-ascii?q?9a23=3A+2pWs2nn25LVWIxIOsf/C0PefT7XOWLyzXXBc1W?=
 =?us-ascii?q?bMk1OSYXMSXCzxbFZneM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A5axm1Q/bKSpYjbRp7fgewbaQf9o446+qDmlVqNI?=
 =?us-ascii?q?LqpfbJTVMPzii3Q3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="23142919"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="23142919"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from gabe.freedesktop.org ([131.252.210.177])
 by mtab.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 13:44:20 -0700
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5BCF71120B1;
 Mon, 18 Mar 2024 20:44:19 +0000 (UTC)
X-Original-To: intel-gfx@lists.freedesktop.org
Delivered-To: intel-gfx@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 707C71120B1
 for <intel-gfx@lists.freedesktop.org>; Mon, 18 Mar 2024 20:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710794657; x=1742330657;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=94HwJ5IhvcWEI2OklU8pMwEOAWDXwo0zlhICFjnGTv4=;
 b=KqUEhUr1nPE9CGknOFFltpHlCDc6GPq+FvDVbmarq0E/69M8P9dYjIiQ
 WgADgasaujU2xcFL7RitvY/BOWn7ppA1EeEuAxj3IRJ2EtBjkBh7DYrcv
 M+YXIaXHGxHWCejJqwg4CUr52pivx7BwT23KEXklQk5PdymdSp65UO9+5
 TQ2bxttHCRIo8KDBtBlxp29ZA+LUsp7fwi0vpb6w2JvAbxJym5eT4QcNc
 vXx6HdhMDyMuFvtW3WNTukSB3k7V9s1OQtMmAT1Mc0H6soyjPU1hlJuFz
 5/oJK0TJLvb2fNaPAJtrvQW2VAOve5gIkj8Tq/6EkBoDcbFbp3JOXpMjd A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="16273734"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="16273734"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 13:44:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="827781923"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="827781923"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 18 Mar 2024 13:44:13 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 18 Mar 2024 22:44:12 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>,
 Sameer Lattannavar <sameer.lattannavar@intel.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Simon Ser <contact@emersion.fr>, Daniel Stone <daniels@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: [PATCH v3 1/2] drm: Introduce plane SIZE_HINTS property
Date: Mon, 18 Mar 2024 22:44:07 +0200
Message-ID: <20240318204408.9687-2-ville.syrjala@linux.intel.com>
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

Add a new immutable plane property by which a plane can advertise
a handful of recommended plane sizes. This would be mostly exposed
by cursor planes as a slightly more capable replacement for
the DRM_CAP_CURSOR_WIDTH/HEIGHT caps, which can only declare
a one size fits all limit for the whole device.

Currently eg. amdgpu/i915/nouveau just advertize the max cursor
size via the cursor size caps. But always using the max sized
cursor can waste a surprising amount of power, so a better
strategy is desirable.

Most other drivers don't specify any cursor size at all, in
which case the ioctl code just claims that 64x64 is a great
choice. Whether that is actually true is debatable.

A poll of various compositor developers informs us that
blindly probing with setcursor/atomic ioctl to determine
suitable cursor sizes is not acceptable, thus the
introduction of the new property to supplant the cursor
size caps. The compositor will now be free to select a
more optimal cursor size from the short list of options.

Note that the reported sizes (either via the property or the
caps) make no claims about things such as plane scaling. So
these things should only really be consulted for simple
"cursor like" use cases.

Userspace consumer in the form of mutter seems ready:
https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3165

v2: Try to add some docs
v3: Specify that value 0 is reserved for future use (basic idea from Jonas)
    Drop the note about typical hardware (Pekka)
v4: Update the docs to indicate the list is "in order of preference"
    Add a a link to the mutter MR
v5: Limit to cursors only for now (Simon)

Cc: Jonas Ådahl <jadahl@redhat.com>
Cc: Sameer Lattannavar <sameer.lattannavar@intel.com>
Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
Reviewed-by: Simon Ser <contact@emersion.fr>
Acked-by: Daniel Stone <daniels@collabora.com>
Acked-by: Harry Wentland <harry.wentland@amd.com>
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_mode_config.c |  7 ++++
 drivers/gpu/drm/drm_plane.c       | 56 +++++++++++++++++++++++++++++++
 include/drm/drm_mode_config.h     |  5 +++
 include/drm/drm_plane.h           |  4 +++
 include/uapi/drm/drm_mode.h       | 11 ++++++
 5 files changed, 83 insertions(+)

diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 48fd2d67f352..568972258222 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -372,6 +372,13 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
 		return -ENOMEM;
 	dev->mode_config.modifiers_property = prop;
 
+	prop = drm_property_create(dev,
+				   DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_BLOB,
+				   "SIZE_HINTS", 0);
+	if (!prop)
+		return -ENOMEM;
+	dev->mode_config.size_hints_property = prop;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 672c655c7a8e..eecc24c54efd 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -140,6 +140,25 @@
  *     DRM_FORMAT_MOD_LINEAR. Before linux kernel release v5.1 there have been
  *     various bugs in this area with inconsistencies between the capability
  *     flag and per-plane properties.
+ *
+ * SIZE_HINTS:
+ *     Blob property which contains the set of recommended plane size
+ *     which can used for simple "cursor like" use cases (eg. no scaling).
+ *     Using these hints frees userspace from extensive probing of
+ *     supported plane sizes through atomic/setcursor ioctls.
+ *
+ *     The blob contains an array of struct drm_plane_size_hint, in
+ *     order of preference. For optimal usage userspace should pick
+ *     the first size that satisfies its own requirements.
+ *
+ *     Drivers should only attach this property to planes that
+ *     support a very limited set of sizes.
+ *
+ *     Note that property value 0 (ie. no blob) is reserved for potential
+ *     future use. Current userspace is expected to ignore the property
+ *     if the value is 0, and fall back to some other means (eg.
+ *     &DRM_CAP_CURSOR_WIDTH and &DRM_CAP_CURSOR_HEIGHT) to determine
+ *     the appropriate plane size to use.
  */
 
 static unsigned int drm_num_planes(struct drm_device *dev)
@@ -1729,3 +1748,40 @@ int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
 	return 0;
 }
 EXPORT_SYMBOL(drm_plane_create_scaling_filter_property);
+
+/**
+ * drm_plane_add_size_hint_property - create a size hint property
+ *
+ * @plane: drm plane
+ * @hints: size hints
+ * @num_hints: number of size hints
+ *
+ * Create a size hints property for the plane.
+ *
+ * RETURNS:
+ * Zero for success or -errno
+ */
+int drm_plane_add_size_hints_property(struct drm_plane *plane,
+				      const struct drm_plane_size_hint *hints,
+				      int num_hints)
+{
+	struct drm_device *dev = plane->dev;
+	struct drm_mode_config *config = &dev->mode_config;
+	struct drm_property_blob *blob;
+
+	/* extending to other plane types needs actual thought */
+	if (drm_WARN_ON(dev, plane->type != DRM_PLANE_TYPE_CURSOR))
+		return -EINVAL;
+
+	blob = drm_property_create_blob(dev,
+					array_size(sizeof(hints[0]), num_hints),
+					hints);
+	if (IS_ERR(blob))
+		return PTR_ERR(blob);
+
+	drm_object_attach_property(&plane->base, config->size_hints_property,
+				   blob->base.id);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_add_size_hints_property);
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 973119a9176b..9d8acf7a10eb 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -942,6 +942,11 @@ struct drm_mode_config {
 	 */
 	struct drm_property *modifiers_property;
 
+	/**
+	 * @size_hints_propertty: Plane SIZE_HINTS property.
+	 */
+	struct drm_property *size_hints_property;
+
 	/* cursor size */
 	uint32_t cursor_width, cursor_height;
 
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 641fe298052d..ec1112208b73 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -32,6 +32,7 @@
 #include <drm/drm_util.h>
 
 struct drm_crtc;
+struct drm_plane_size_hint;
 struct drm_printer;
 struct drm_modeset_acquire_ctx;
 
@@ -976,5 +977,8 @@ drm_plane_get_damage_clips(const struct drm_plane_state *state);
 
 int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
 					     unsigned int supported_filters);
+int drm_plane_add_size_hints_property(struct drm_plane *plane,
+				      const struct drm_plane_size_hint *hints,
+				      int num_hints);
 
 #endif
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 7040e7ea80c7..1ca5c7e418fd 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -865,6 +865,17 @@ struct drm_color_lut {
 	__u16 reserved;
 };
 
+/**
+ * struct drm_plane_size_hint - Plane size hints
+ *
+ * The plane SIZE_HINTS property blob contains an
+ * array of struct drm_plane_size_hint.
+ */
+struct drm_plane_size_hint {
+	__u16 width;
+	__u16 height;
+};
+
 /**
  * struct hdr_metadata_infoframe - HDR Metadata Infoframe Data.
  *
-- 
2.43.2
