Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 932EE87FA87
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 10:14:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A008C10F8DF;
	Tue, 19 Mar 2024 09:14:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="imrCH8EW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 404C810F8D7
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 09:14:39 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5529717"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; 
   d="scan'208";a="5529717"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 02:14:39 -0700
X-ExtLoopCount2: 2 from 10.237.72.74
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="827782079"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; d="scan'208";a="827782079"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 19 Mar 2024 02:14:37 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 19 Mar 2024 11:14:36 +0200
Resent-From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Resent-Date: Tue, 19 Mar 2024 11:14:36 +0200
Resent-Message-ID: <ZflXfAAIUfex0xUO@intel.com>
Resent-To: dri-devel@lists.freedesktop.org
X-Original-To: ville.syrjala@linux.intel.com
Delivered-To: ville.syrjala@linux.intel.com
Received: from linux.intel.com [10.54.29.200]
 by stinkbox.stink.local with IMAP (fetchmail-6.4.37)
 for <vsyrjala@localhost> (single-drop); Mon, 18 Mar 2024 22:49:03 +0200 (EET)
Received: from orviesa003.jf.intel.com (ORVIESA003.jf.intel.com
 [10.64.159.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id CAE2C580D4E;
 Mon, 18 Mar 2024 13:44:16 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="18315577"
Received: from fmvoesa102.fm.intel.com ([10.64.2.12])
 by ORVIESA003-1.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 13:44:17 -0700
X-IPAS-Result: =?us-ascii?q?A0FYAgCypvhlmLHS/INaHgEBCxIMQIFECwKCNxkBYlaBC?=
 =?us-ascii?q?YQaPIh8iQSZa4QGgUAyGwEBAQEBAQEBAQkuCwgBAgQBAQMEhH+IBQImNgcOA?=
 =?us-ascii?q?QIEAQEBAQMCAQIBAQEBAQEIAQEBAgIBAQECAQEGAwEBAQECEAEBAQEBAQEBH?=
 =?us-ascii?q?hkFEA4nhS89DT8WAYFhJQGBHl4HCTgBAQEBAQEBAQEBAQEBAQEBAQEBAQEUA?=
 =?us-ascii?q?g1bASABAQQBAQkXDwENAQEECikBAgMBAgYCCBcFAh4EBAICAwFrBYJ7AYJfA?=
 =?us-ascii?q?wUMl2SbOnqBMoEBggoBAQaBTgGvUYFhAwaBGi4BiCUBhFOEZHonD4FVRHpQg?=
 =?us-ascii?q?zOBUoJJPTiDDoJogheDEimFRRCMb4tySoEJHAOBBWsbEB43ERATDQMIbh0CM?=
 =?us-ascii?q?ToDBQMEMgoSDAsfBVQDQwZJCwMCGgUDAwSBLgUNGgIQLCYDAxJJAhAUAzgDA?=
 =?us-ascii?q?wYDCjEwVUEMUANkHxoYCTwPDBoCGxQNJCMCLD4DCQoQAhYDHRYEMBEJCyYDK?=
 =?us-ascii?q?gY2AhIMBgYGXSAWCQQlAwgEAxBCAyByEQMEGgQLB1Imgz8EE0QDEIE0iiKDQ?=
 =?us-ascii?q?iqBd4JFAwkDBwUsHUADCxgNSBEsFh8UGygeAW8HojkBglsqZSuYba8ENAeEF?=
 =?us-ascii?q?YFbBgyKHZUdGjOXU5JbLpgxiXeDeZsMgWsLKAKBWjMaI4M3Ez8ZD44gg3qFF?=
 =?us-ascii?q?IpnQTUCATgCBwEKAQEDCYVGAQGBaoE9MgGBRwEB?=
IronPort-PHdr: A9a23:5UQ7gBJu9Ozg2udajdmcuIxiWUAX0o4c3iYr45Yqw4hDbr6kt8y7e
 hCFtLM90xSQBtqTwskHotSVmpijY1BI2YyGvnEGfc4EfD4+ouJSoTYdBtWYA1bwNv/gYn9yN
 s1DUFh44yPzahANS47xaFLIv3K98yMZFAnhOgppPOT1HZPZg9iq2+yo9JDffQFFiCC+bL5wI
 xm6sAvcu8sLioZ+N6g9zQfErXRPd+lK321kIk6dkQjh7cmq5p5j9CpQu/Ml98FeVKjxYro1Q
 79FAjk4Km45/MLkuwXNQguJ/XscT34ZkgFUDAjf7RH1RYn+vy3nvedgwiaaPMn2TbcpWTS+6
 qpgVRHlhDsbOzM/7WrakdJ7gr5Frx29phx/24/Ub5+TNPpiZaPWYNcWSXNcUspNSyBNB4WxZ
 JYNAeUcJ+ZVt4nzqUUQoBWjCweiB+ThxTBUiXH5xa030eYvHA7b0AEuA94Brm/Uoc7pNKoRS
 +250LPFwSnBYv5QxDzz6JLIchckofyUUr1wcM7RyU0xGAjYk1uRqZblPzGP2eQJqWeQ8u1tV
 fyui24jrwF+vCKjxtwsi4nThIIa0FTE+j9izYYxJN24TlN7YNG+HJtRsSGaK5V5Qsc4T250v
 yY6z6QLtJimdycF1Jop3QTQa+Cbc4eW+BLjUv6cLDlmiXxldr+ymxa8/0a9xuDySMW5zlVHo
 zZHn9TQt30BygLe5tWHR/Zg8Uqv1jWC2gTR5+1YI005iKrVJp4lz7M2i5Edv0PDHirsl0X3i
 q+bbkok+u6v6+TifLrqvJicN5V7ig3mPKQugNKwDvolPQcQRGib+vi81Lr7/UHjR7VKlPI2n
 6/Eu57ZPcQWvrO1DgFI3oo59RqyDymq3M4GkXUaMF5JYg+LgorrNl3WPfz1Cemzj06xnDpvx
 P3KJKDtD5TDI3TZjbvtYLBw4FNCxQo30NBf/I5UBa8bIPzuW0/wtcLXAwclPwGy3u3pEs9y1
 pkEVmKKGqKZML3dsVuP5u83LOmDfpQatyjnJ/gr/f7hk2E2lkIDcqmy3psXdHe4Hux8L0Wee
 3rsjc8NEWYMvgUgUOznkECOXDBOa3qoQa4x5i83BJi4AYveWoyhmqGN0SW5E5FOY2BJEFGME
 XPmd4WeXPcMbTqfIs5nkjwYS7ehT5Yt1R6gtA710rZoNe3U+jAetZ3/ytd1/PbelRUz9TxvE
 8SdyHuBT29unmwWWTA5wb5woVd+ylef1qh4m+ZUFdtJ5/NGSgs6M4XTwPRgC9/uQgLBYsuJS
 FG+T9m7Ajw9VsgxzMMWY0ZhB9WiiQjO0DC3DLAPkryHHpk08qPH33nwO8l8ymzJ1Ko6glkiQ
 8tPM3Cmh6Fl+wjSAY7Jj1uWl6KweasA2y7N8X+PzXCSs0FATA5wTaLFUGgFaUvQsNv551nOT
 6SuCbUnLgtByNWPKq9Lat3vkFVHS+3vONXYY2KthWiwAQyEya+LbIrvY2kdxjnSCFAYkwAP+
 naLLQo+CT2no2LfFjBuE1PvY0Dx8el6sny2VUs0zwCMb0182Lu54B8VhfqAS/wN2rIIojsuq
 zJxHFqlxdLZF8KApxZ9fKVbed494k1I1WTEtwxmP52sNaNihkQfcgV3pEPv1gl3CoJOkcgrr
 3Mn1w5yKaOe0FNceDKUx5HwOrvLKmbs+BCjcbLZ2lbb0NqO4KcA9Ow4q0n/vAGuDkci8XJn0
 95T03SG/ZXGFg4SXojxUkYr9hh6oa/VYi8m6oPQ1H1sN7S0szDY19IoAusl1givf9NFPKyYE
 w/yFtUWB9KyJ+wyh1ipchUEMfhR9KEuPsOqbeWG17CrPOZlhj2mi3pI4IZm30KI9ip8TPPI3
 pkfz/GZ2AuHSynzjFO7vs/rnoBEYGJaI2yk1CKxBJJNfrYgOsEPCHyyOIu53Nhzi5P2WGJf7
 BikHVxB3caofR+baRv6
IronPort-Data: A9a23:dSqTt6MWwEt4tS3vrR1DkcFynXyQoLVcMsEvi/4bfWQNrUoihWcOy
 WoWC2qPPPvYa2DzLt9+b4myoxsG6MPdm4JqGQZtpSBmQlt08vbIVI+TRqvS04J+DSFhoGZPt
 p1GAjUVBJlsFhcwgD/zbOC5xZVb/fjRHuOjYAL8EnktA1UiEk/NsDo588YhmIlknNOlNA2Ev
 NL2sqX3NUSss9JOGjt8B5mr9lU345wehBtC5gZiPasS7AeE/5UoJMt3yZ+ZfiOQrrZ8Q7bSq
 9brlNmR4m7f9hExPdKp+p6TnpoiGea60aCm0xK6aoD66vRwjnVaPpUTbZLwXXxqZwChxLid/
 v0W7MDtFl15VkH7sL91vxFwS0mSNEDdkVPNCSDXXce7liUqf5Z3qhnH4Y5f0YAwo45K7W9yG
 fMwLW4MQ0/TmMmN5fGLavRtj4MfEY73I9ZK0p1g5Wmx4fcOTpnJTuPE/9JV0DorhdxJBbDZf
 cVxhThHNU+ZJUcSYBFNUcp4xbj37pX8W2UwRFa9pKwr7myWwwJhlbLqLdzed8eiQcROgl3eq
 HjL8mj0GRIGM8TZziCKmp6prrWUxH+hCdtNfFG+3tJK0XiShXULMSxVDgecgLq2jEPvSd0Kf
 iT4/QJ38fdjpRXDosPGdxS0qXvCux8HSdFCGu4S7ACL17qS4gCFC2xCRTlEAPQvssM3Aycqx
 0OIt9foAyF/9ryTVX+ZsLyTqFuaOyETLCkEZCwZSQIt59jlvZF1jxTTQ9IlG6mw5vX3EDft2
 CLMrzIslq4BkckF1qaT+VHBniLqp57VQwpz7QLSNkqn6QR/bZXjY4Wo9Vnd4PBoKIefU0nHv
 X4YlszY5+cLZbmOnS3LXugNGbiv6vCtNDzanE4pHp89+jDr8HmmFahT6TR/IAFqNcAFdDT7Z
 l77vQJX+Y8VPX22YKsxaIW0Y+wvxKH6CdnjEPTdaNlOZYJqaCeD/SdzdQiR2XzglA4nlqRXE
 ZKSesehDzACALhqyDGkVuQ11b4t2zB4xGXPSJS9xBOiuZKbbWSeSLFDOlaUaOkl67yFqxf99
 9dZKtvMyhNDXem4aS7SmaYWJE0QKj4wBZ32osZ/cu+FPxogGWc9BvuXyrQkE6Rgnq9Vn+rMy
 X+gcktZzkfvw3zBNQiOLHtkbdvHWJd8pDQ4ICs0JV+s0lAnYICy/OEecYc6ef8s8+kL5fh1V
 fwCaoOMC+9nTjXB5iRbbJ/hoYgkfxOu7SqSOC+seyp5ep97WwXV0tvleBb/sigIEiez88A5p
 tWIyh3BXZkEARl4F9vSafSHy1K3oGhbmeRuUk+OKd5WEG3y8YxuJmrqn+U1KsUFARHCwCaKk
 QeQHRoc4+LKpucd4tnEg7GZsK+tEu1jDgxbGXXW6fC9Miyyw4a46YBJWuvOcyrQWW/546a+Y
 v0TyOvzWBEaoLpUm48iEps0nb0V3P6sl59Hzw0jIEiMc0v+X9uMPUK69cVIs6RMwJpQtg23R
 l+D97Fm1VOhZZuN/Lk5eVBNUwiT6cz4jAU++hjcHakXzCB+9rfBX19fMhWBky9BK6MzN5kqq
 QvAhCL0w1zk4vbJGo/Y5syxy4hqBiFYO0nAnsxAaLIHciJxljl/jWX0U0caGq2nZdRWKVUNK
 TSJnqfEjLk07hOdKiJsRSaSg7YC3cVmVPV2ILkqegzhdj3t26Vf4fGt2W5fovl9kEgaiLwb1
 pZDaxAdyVqyE8dA3ZQcDjH1c+2wLAWe4FD1wl0F3HbFRlWlHnHLLXMwI/2M4FFxzo6vVmYzw
 V1s8068CWyCVJiohkMaABc1w9S9FoYZ3lOZx6ia8zGtQsNSjczN2PH+PALlanLPXKsMuaEwj
 bUyp7ovNvygbXB4Tm9SI9Dy6In8gSusfQRqafBn4K4NW2rbfVmPNfKmcShdpuslyzf2HYNUx
 iCgyg+jl/hz6cpWkg0m
IronPort-HdrOrdr: A9a23:snFL7qnDjd9OaqxOU0pdrGo08wTpDfK33DAbv31ZSRFFG/Fw9/
 rFoB3U726OtN93YgBRpTngAtjwfZq4z/BICOYqTMqftWPd1FdAErsSp7cKrweQYhEXGIZmpN
 Fdm4YXMqy5MbFRt7eP3OGAe+xQieVuGsiT9KzjJg5WPHZXgsJbnnlE42SgYzFLrVJ9dO8E/f
 Onj6ItyEvCCBNnCPhTKUN1EtQrzOe77q4ODyR2fyLOKWG1/ECVAfnBYnqlNxElMlM/pMZHzY
 G8qX2H2k0t28vLuCM0ulW/06hr
X-Talos-CUID: =?us-ascii?q?9a23=3AMBj83WnWajVgmLGknyTZOA98sizXOXiDzVqPc1C?=
 =?us-ascii?q?TMkMqeJ2ISFbXxJ4jj9U7zg=3D=3D?=
X-Talos-MUID: 9a23:E28JZwseWAEwoDGGvM2nqBEzEcYr+ryXOQNWzbIn+MaCOH1iNGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="23142917"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="23142917"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from gabe.freedesktop.org ([131.252.210.177])
 by mtab.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 13:44:15 -0700
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9F57C1120AF;
 Mon, 18 Mar 2024 20:44:14 +0000 (UTC)
X-Original-To: intel-gfx@lists.freedesktop.org
Delivered-To: intel-gfx@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71AAF1120AF
 for <intel-gfx@lists.freedesktop.org>; Mon, 18 Mar 2024 20:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710794653; x=1742330653;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DYk1kkQmtaawJ6CjjwaxJSU6NAhmGbkgyXFZBhjn/mM=;
 b=imrCH8EWZbIhmvAL77nZM8HYm3KRtr4ZYgWnrRw1UsiZ8mbs+SSulUr2
 9rTkHlrPF5dheBk+serz9rAGgBPiVGo29g7VbnmTEEAHbRrHc5PH1N5ot
 Jtj+LvfKDhWOHNzTnpEEGiqHLIJ1Jpba/HeOFxgQH5mOZAYClFwzreW4I
 kceBk1a7MTA1IRVaQPfykuSQc3acrEhkp8HnIAxzjRZ+1Y+hHoml28Rke
 kLrE8dVo71BVPMOepduarPQWGM6/Aky1EXV5UZubBq34JVLxL8b9Xt5f2
 0QLMdgNBQ5yFxiIW/p8pgF8am8bM2SRyUh8TzxlMa54gcMCLwecqkCjES A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="16273729"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="16273729"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 13:44:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="827781920"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="827781920"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 18 Mar 2024 13:44:09 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 18 Mar 2024 22:44:08 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Simon Ser <contact@emersion.fr>,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Sameer Lattannavar <sameer.lattannavar@intel.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: [PATCH v3 0/2] drm: Add plane SIZE_HINTS property
Date: Mon, 18 Mar 2024 22:44:06 +0200
Message-ID: <20240318204408.9687-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
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

Final final version I hope. Mainly for CI to test against the
new IGTs.

Real userspace implementation:
https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3165                                                           

IGT:
https://patchwork.freedesktop.org/series/131199/

Changes from v2:
- Limit to cursor planes only (Simon)

Test-with: 20240315191505.27620-1-ville.syrjala@linux.intel.com
Cc: Simon Ser <contact@emersion.fr>
Cc: Jonas Ådahl <jadahl@redhat.com>
Cc: Daniel Stone <daniel@fooishbar.org>
Cc: Sameer Lattannavar <sameer.lattannavar@intel.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>

Ville Syrjälä (2):
  drm: Introduce plane SIZE_HINTS property
  drm/i915: Add SIZE_HINTS property for cursors

 drivers/gpu/drm/drm_mode_config.c           |  7 +++
 drivers/gpu/drm/drm_plane.c                 | 56 +++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_cursor.c | 24 +++++++++
 include/drm/drm_mode_config.h               |  5 ++
 include/drm/drm_plane.h                     |  4 ++
 include/uapi/drm/drm_mode.h                 | 11 ++++
 6 files changed, 107 insertions(+)

-- 
2.43.2
