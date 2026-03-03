Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLU8AoldqGmZtgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 17:27:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E722043F7
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 17:27:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0130610EA66;
	Wed,  4 Mar 2026 16:27:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YZyc7CmX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5926910EA66
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 16:27:47 +0000 (UTC)
X-CSE-ConnectionGUID: n9j3xPGhQWa3cQOTkModag==
X-CSE-MsgGUID: b37TTkilRXqp4mu9ZXxy5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="72734973"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="72734973"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 08:27:46 -0800
X-CSE-ConnectionGUID: NpMTMfmDSsSBBsVaHKCJeQ==
X-CSE-MsgGUID: vYoLPHHgQYi/LZ8ekJ4IUQ==
X-ExtLoopCount2: 2 from 10.245.246.84
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="218527127"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.84])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 08:27:46 -0800
Resent-Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business
 Park, 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Resent-To: dri-devel@lists.freedesktop.org
Resent-From: Jani Nikula <jani.nikula@intel.com>
Resent-Date: Wed, 04 Mar 2026 18:27:42 +0200
Resent-Message-ID: <beecc5a53574c0724b2a8a84e3e6dc1e2212956c@intel.com>
X-Original-To: jani.nikula@linux.intel.com
Received: from orviesa002.jf.intel.com (ORVIESA002.jf.intel.com
 [10.64.159.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 9FC9D20B5871;
 Tue,  3 Mar 2026 04:26:59 -0800 (PST)
X-CSE-ConnectionGUID: 5eltX3UnTu2tY8q1LBC2/g==
X-CSE-MsgGUID: Yc8n2+iwTzGFLUdF6sy4EQ==
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="248477960"
Received: from fmvoesa113.fm.intel.com ([10.64.2.23])
 by orviesa002-1.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 04:27:00 -0800
X-CSE-ConnectionGUID: qQTaNCaVRzedtSCcgOrhSA==
X-CSE-MsgGUID: aPQL+BYjT2uI255jVxksKA==
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A0HPAADu0qZpj7HS/INagQmBUIFuUxYEAWyBaoRYg00BA?=
 =?us-ascii?q?YUshA2EbJg/hDOBK4FAMA0RAQEBAQEBAQEBCAEuDxEBAgQBAQMEhQCNIgImN?=
 =?us-ascii?q?AkOAQIEAQEBAQMCAQIBAQEBAQEBAQEBAQsBAQECAgEBAQIBAQYDAQEBAQIQA?=
 =?us-ascii?q?QEBAQEBOQVJhglGDYI9HoEsXgcJOAEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?RECDTAuASABAQQBAQ8RBAsBDQEBBAopAQIDAQIGAiQCHgQEAgIDASIBCisOA?=
 =?us-ascii?q?QQBBB2CYAGCIgEGSgMBAgIMm1ABgT0Ciip6fzOBAYIMAQEGBATcIoFkAQIDB?=
 =?us-ascii?q?hQBgQouhW+CZQGBcIMQdIQAeicPgVVEehsygzaBUngXAQMBF4FbOIMOgmmDI?=
 =?us-ascii?q?BSTBgk/gQIcA1ksAVUTDQoLBwU+gSgDNRIqFW4yHYEjPhczWBsHBTuDIoF/D?=
 =?us-ascii?q?4hzdm6BE1SBTwMLGA1IESwWIRQbBD5uB41kP4FCawcBgQ0sIoFbk2SzGTQHh?=
 =?us-ascii?q?B+BXgYMii6NPogWM6prLodlkHOOCZZQhD0CBAIEBQIQAQEGgWg6AoFaTSODN?=
 =?us-ascii?q?1IZD44tFhyDQoUTvit3EioCBwEKAQEDCYVGAQGMVQGBSwEB?=
IronPort-PHdr: A9a23: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
IronPort-Data: A9a23:2nmeX6NIhVqW2z/vrR3QkcFynXyQoLVcMsEvi/4bfWQNrUok1mcOn
 2ccD26DOKuNZ2qjedF0Po/iox5Q6JXQm9c1GwZtpSBmQlt08vbIVI+TRqvS04J+DSFhoGZPt
 p1GAjUVBJlsFhcwgD/zYuC5xZVb/fjRGeOjYAL8EnkvA1ciFGF50EwLd9cR2OZAmcK+Dx6Gp
 eT8qsjePE7N8zNvOwr40YrawP9UlKq04mpwUmAWP6gR4geFzyNNVvrzGInoR5fGatgMdgKFb
 7ubpF2J1jux1wsgDNqjjoH6fiUiKpbOPRKDg2ZhQKOrhB5PvEQais7X49JHMS+7Ix3Q9zxA4
 I0lWa6YEG/FDYWV8AgpaCS0JgklVUFw0OSefSXg65z7I3ruKBMAy902ZK0/0BZxFuxfWQmi/
 tRBQNwBg4vqa0tbD9tXR8E17vnPIvUHM6sGg01p6xrQM8w0TJzfeI7B6vhC3AwZ05Um8fb2P
 6L1aBJgZR7NJRNVN1obBYk9gOCwwH7lfFW0qnrM/vNxuTWJilYoiP60b4W9lt+iHa25mm6Zo
 H7L+yH2DAFfPtuCzzGI6Vqoh/TThmX1Qo8fGLCj9eJtmBuU3GN75Bg+CgHl+aPi1B/Wt9R3I
 nQt3mkEnKoOrlGKFISgXSOoo2Wnl0tJMzZXO7Rmt1Dck8I4+T2xD2QNS3hEacc0v90/RhQu1
 1mUj5XoAyBitPueTnf13ryUtzKpfzBTMm4GfigCZQ8E5cTz5oA1kh/LCN1kFcadjNTzGHf2w
 jOXqCEWg7QVkN5N1qOn8FSBiDWpzrDLRwgo/ReRXXi3/xhreImrZo+A7Vnd8OYGLYCFQ13Ht
 38B8+Cc6+cIBIrLkCWNXOQLEbeB4/eDLS2agFhzEp1n/DOok1agdIEW/jx+IU5vP8AsfT7vf
 V+VuAVN6ZsVN3yvBYd0aoewD4Ipyq7hGN/3UOH8attIf4g3dQmb8SUobkmVt0jomUMtnKN5I
 Z6HfMKnH2cZIaBmyiemAeYbzbIvgCs5wAv7QJnhxBWhl7CTfnicVbAaMVCcRuQ46r6U5gTT7
 9tbccCNzn13Vez1YiDa9bkdMHgOLH4mFdb3rdBacqiIJQ8OMGQgCPaXwq4mY5Rsm619kubO4
 2H7W0lExV65jnrCQS2Ma2pmb6KpUZ9khXY6OzE8e1eux3UnJ42o6c83b5YrcKNh7+Fly/dcS
 /gDZtXGA/JTRzCB8DMYBbHhq4lrbwbtgAOVIyO5SDw+eYNwAQ3P5tLgOADo8UEmEjStqcg55
 aC6zR7fQJwrQwVkEdaQafSzwlf3tn8Y8MpsXk/ML59IaV/u+YxjAyjwiOInZcAKNRjHgDCd0
 m6+ExcVo/jQvKcx8d/UleaFqZukF611GU8yIoXAxbm/PySc8HCuzINNS+WUeiibU3n7kEm/W
 QlL5+jFDPQht190iZhxH6pQ5qkxwMHvnJYPm2yIA073g0KX5qSMy0RqMOFAv6dAgLFDtAa6V
 1mM5t5Cf7KTN6sJ8WL9xiJ1P4xvNtlNxFE+CMjZxm2nv0ebG5LaCy1v0+Gk0nA1EVeMGNpNL
 R0dVDEqB/yX00Z1Y4ff5syl33yLNGAEWqMr/ooGCZPmwhcty09Pe4fdFj6e3axjn+5kaxFwS
 hfN3fKqr+0FliLqLSFpfVCThrU1uHj7kEwRpLP0DwjSwoKd7hL2tTUNmQkKovN9lEsZiLMrY
 jc3biWY58ympl9VuSSKZEj1cylpBRuF90i3wFwM/FA1hWHyPoARBAXR8tphMKzUH6yws9SbE
 HylJL7ZbAvX
IronPort-HdrOrdr: A9a23:JjwKAaPWv2t/DcBcT9v255DYdb4zR+YMi2TDiHoBNyC9I/bo6P
 xGws5rqSMc6Ax6KQAdcdDpAtj1fZq6z+8+3WBxB8boYOCCggWVxe5ZnP3fKlfbdxEWyNQt/5
 uIH5IOeuEZ4zBB/JDHCCfRKacJ/DCsytH9uQ/mp00dZD2DgclbnixE43+gYxpLrWp9dNYE/f
 inl4N6TmGbCCEqh62AbxFvMJmn1qW77+OdEGN2d29V1OCgt0KE1FeQKWnu4v5xaUI7/V/imV
 K1wDDR1+GIid3+4Bna0GPY8pRRn/Xc6vYrPq387vQ9G3HHsCrtQJ5udYGjkVkOwJDJ1L58++
 O87ivIeP4DjU85M1vF5ScF3TOQs0dNmgbf4G7dpUGmjd3yRTo8BcYErYVFciHB405lmN1nyq
 pE00+QqpISVHr77WLAzumNcysvulu/oHIkn+JWp3tDUbEGYLsUiYAE5ktaHLoJASq/woE6F+
 tFCt3a+Z9tABSnRkGcmlMq7M2nX3w1EBvDak8euvaN2zwTp3x9x1tw/r1dol4wsLYGD7VU7e
 XNNapl0JtUSNUNUK57DOAdBeOqF23kW3v3QTmvCGWiMJtCF2PGqpbx7rlwzvqtYoY0wJw7n4
 mEeE9EtFQ1Z1nlBaS1rcV2Gyj2MTiAtAnWu51jD8ATgMyieFOrC1zbdLkWqbr7nx1FaferBc
 paO/ptcr/exCXVaNd0NjbFKthvwEklIYIoU+kAKhyzS7rwW8XXXmOySoeAGFPMK0dnZoqtOA
 pHYNGfHqh9BwaQKy/FvCQ=
X-Talos-CUID: =?us-ascii?q?9a23=3AtYexq2t4ZUGU9wtmtWAxic8j6Is8S0HU6lzZHXW?=
 =?us-ascii?q?qBGp1c5aeRniK+JhNxp8=3D?=
X-Talos-MUID: 9a23:TmV0AwR36zt50H7SRXTlvAhGd+1Z4Zj0FWFXzMgEhdmHLg9ZbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="72602369"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="72602369"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from gabe.freedesktop.org ([131.252.210.177])
 by mtab.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026
 04:26:58 -0800
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8E58E10E06F;
 Tue,  3 Mar 2026 12:26:57 +0000 (UTC)
X-Original-To: intel-gfx@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A448E10E7AA
 for <intel-gfx@lists.freedesktop.org>; Tue,  3 Mar 2026 12:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772540814; x=1804076814;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=lSoDxiXziahfJmQcp+gAd25lBRy6a9fihiUFE/rd4bA=;
 b=YZyc7CmXFc8Fkwr+ERpnqeiYOkiubj5DthmbR7AVTUuwJN6vONWFzP/G
 IIY5JNWkdS/gsfZsayd3+pVs+IcXGVAEIbf9VPYMqHp4XpIWH7sy1eVCu
 2/pe6/QZUO73HCXnUyxqqSlHc60p7Nc9ScRFZe+SjNZdctsXy6PZvtQ0m
 OukQsFpt0wJjTLJmxeSLzfUQMlBztNlaaUeutYMqT49nKWP19snAce0qZ
 ZVGFsnQMGmCddEmPBzztdL7r3YZ5JOivmuwnWPIS+GA5d8Cbb/Y7WCRyr
 GrNpfy5ZIDJGgjfbrs1FfMVPA7fxvYiNn9YPWtv9l1C3WmgzvJoX2FfuP Q==;
X-CSE-ConnectionGUID: Lomi/6N5TEGl7TX8S1QWmQ==
X-CSE-MsgGUID: X65qqIeWTx2/FXf73yQu+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="84922112"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="84922112"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 04:26:52 -0800
X-CSE-ConnectionGUID: HP8jL+BuRoauNb5KZTz9lQ==
X-CSE-MsgGUID: Pvmrb64/T+Cbk2zEYMb9Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="220990571"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 04:26:52 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 04:26:52 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 04:26:52 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.53)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 04:26:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJCNy/mySD3AlgSG/nJllfzPOHXBw/l7PjsoU0TnkEPd62F8WjREVIyoMpBy3IpJ5DRd67d3tq2GSZhXx3B3APnTxmLqob20j4BbE2ujtkImd/m/Gix2gCY740HvtlWaicKQu5d8Z36uiPOH/MhWzinoXf9VjwCrfqWG9cAf8xJSb97rV1vgdoECf+wv0e+PA7MNglMPnYY2ISyz8Pe9zYg8Wgfx93ur7F2PDhYkb5JLN/uLFYyCTA3HOsCyWHQIZhPYRAM5gfGgTTTb6pyLT2wuhkjtUnQgn2u0V0arjdfMxw0limCsPyI76/fyT8lk+7ggQ8XacvKb10PgoEUwOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZlZQS0u4T+N6DZoVcrM3Hy8Mi/opFAPVWgrfegfz2GU=;
 b=r9VRCJIJoNCtTIPXICzD2pS8X1QDgVfmMAuOuc7+IMY86JNVuBjBilzLs/SiQZvNxGs7l8IEDYPoO+wYbJ2I11TtgkmpuhYLwsW+cgxRm7XkrDDX0M8Fs/hQL7oRKdEztJP3E+2nMIjdBujrGBp0OgDU52KBTuR4m+y/daL4ScBMyXPQSN39u6FSHzrsuE7fYIafml7nQZwF5Yu3JyOZZ8TkwGuLA/06XLiWgj16EJ6XQlIulKhvW2euTGouHfunn0eywyF3zUsaOs+W/6DF5y6igsXLUfHyG5wgnASmeSKdy8zrG6C5QY8i8I97RSMcYD/jjDUqJw/E1JYnEawnrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by MW4PR11MB6569.namprd11.prod.outlook.com (2603:10b6:303:1e1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 12:26:49 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.20.9632.017; Tue, 3 Mar 2026
 12:26:48 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <andi.shyti@linux.intel.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
Subject: [PATCH v2] drm/ttm: fix NULL deref in ttm_bo_flush_all_fences() after
 fence ops detach
Date: Tue, 3 Mar 2026 13:26:42 +0100
Message-ID: <1c2f34351b6fb70ab576aeac07987542a4d480b2.1772540459.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.52.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0043.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::28) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|MW4PR11MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: 12c8c99f-b750-4949-8b3f-08de79202437
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: ZJdVz/9C3ZbaQX6LNVU18TWX/xezxKIfGTEOZxzrV2llcOB2Vlyn70XTRpRv3fTi6f/IwFj0B1xm+21eZfBIASM7sBCBg4uO9EUXMbWJylJ91qqOfGlp7q5u/soYKGvhDPZVLGTthgEf1ayQLXFYjHvVxlASYJKWMWK0LKZEhkp/U0TMR4PqIttHyL/jIlTdpz6stzNIjSYiN9Go/a82ou++9/mKg+bnZEKb5IqxA54pUxr5ikil5qshClNJYg6iCbwyZS8XjesGIqV6xkv3EyGURv8c4ks97fW14Cf7Y81OM1pSuJtD/rF9b/7d0L/iwO/TPqCTX0Jni1QScWGfRyfCZ9umHcCnPNFGF3i8gOo9EkgZlU4zvFRTB20R6/XsGD15ZnBPnuK/CehNlsyT5vOQm8ncH1eM2xomzLRmzmnH7vyOe58TZUZwdzS+20+93MwQvwg0foKycWWwVwXVheT1gpnhPVaru8hCGp2oSoPl6ucbCAhXxk3CK0RkwZjOEDxtfKhS4tEPh4enUOtaMBYuPiLvkFjI6+cqqbWf6ZKQ9ILbpIQnRY8LpA4ZkLT8jpHgzQNGkxpfRc4u8zskr5oLwj5EPgUD6729S9kTsNK+le6DAILz6lILlcXz4gU8h+Qt/LqVf017vBVfT/QD9zxBjOytZYckvK94smE+vn/nph1uhAwYdL1rlE99KZ1x
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:; 
 IPV:NLI; SFV:NSPM;
 H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE; 
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2xVNVByeVZrbTNoQmpsbmIrUG5zakZTMWdtclVxVkV6TC9CdnZJUUJXczUx?=
 =?utf-8?B?NCtJampkYXg5Uml6VlI1S2hwdWsxQVo1WHdnQjdseUllWkhkNDNQdlRmVmFE?=
 =?utf-8?B?WnlaQzh2ejcyMExkZU0vcGI0NWZIUThIQ0ttOXEzQWhFaFdHTy9UMERUU0dn?=
 =?utf-8?B?dlA1Qmt2cm5Fd21QSjBEVXRrbkFwY1VKZFIyZVk1dHdYdmFkYzMxSy84SjlT?=
 =?utf-8?B?bkdzYWRjYUpxbkRTZFY2WkVwc0hQSVlRbWpzV2ZKdHp6bkxwOW5ZUFRHNE9w?=
 =?utf-8?B?RzZBNzhFOUxpR3d1VTNLSEJ4dWN3dWxmVHZpejBnUFhCeGJvVHZxQXphYjJF?=
 =?utf-8?B?a3NCOGpXRnVZeS9RNjRpMU9jSXhaQkF0MmFYbGZFclROeXlqMndiSnJYcUI4?=
 =?utf-8?B?Wm9OOGNNcW5Rc1lSMDhXZU1RaWh6KzMxWEpFQW8wTktMa3J6UGVEQlYzMVBS?=
 =?utf-8?B?b01PakRtQzI3ZFRkRGRmNm13RXQ1amlLZGVYV3d5VWJncCtkOEFHUGdia01P?=
 =?utf-8?B?bTlmZnZNT0c2U0hKcDl2clBpaHRBazZRaGV0MTI0S2xjRWdocjhUMnlNMFVM?=
 =?utf-8?B?VmpvUmVyaTgvcG5oUitIWitJbWE5TXJwTDhNY2x3L3cvb1M0QXlOaG1JQVpL?=
 =?utf-8?B?Zmk0ZkFGU3IyV2FKWSs2R0pFMmRjUmYvTlVvNk82L1BkZjlSd0ZNOGJGUmsw?=
 =?utf-8?B?MHpTLzR1ZTluMFZaUDN5T1o5L0JyWlBWNzFyTVNXblpzYnovR1BoTXZjRE9r?=
 =?utf-8?B?YU4yMUVURzcrU1hzZG9WUGpFa0NNSjh4YVlqcnBMSld0ZnQyVkdveGZjd0hS?=
 =?utf-8?B?NVZxbDJoN084L1l1MFQzRVBjZjdDUFliNFNyWjQyVHFWV1NoQmZhSnczRzJU?=
 =?utf-8?B?MVJhb1l4NU9aNE1UUTNaVzJQNkZ3YUx2ZnQ4N0NHWFhNc00vRWtHWHlkRm5s?=
 =?utf-8?B?dm95NVJlSFMzUTFaYWdGUUtHNDdqUjZIYWNLUXZrNzdFNTVORkZyN3E2WXJj?=
 =?utf-8?B?SkJOTG4vWlpmZFVwdzNqL0xJL0p4YmJSMGwzMEFkS0lXTzlvVHhGK3A5TlB6?=
 =?utf-8?B?YmVBa1crQnlqbC82SUxYcTE5VE9udWtBRnNuQUdHSHNCMHpKTEkyRkVVT3NJ?=
 =?utf-8?B?bjQxYk5mNk9SMi9ZWUxlL1dBSlBLKzhLTnpSTEU1M2RGQmFsa3MxR1lHTHpw?=
 =?utf-8?B?K2hMaHhCUlJkL2MwQ3M1SXpEWlBtanRnc2xkQkxaaEorL0RPSnlIQXY2RDhN?=
 =?utf-8?B?N2gzTUVSZENvSDV4QTRpUERObTJBYkl6dlEzcU0wY1JOUTZ3RjIyZXRuRTBs?=
 =?utf-8?B?K3NvZ1NnWXI0cHhZVk1PaXFLVTgzN2E2YlFVUmtDZTlKMEluU0M1V3V5aEd0?=
 =?utf-8?B?V1YxZlo2TFE3Q3M4MkEvYjdxOFlMeHlvUzVGYkh5VWFSNTRSbHliUTcxZUE1?=
 =?utf-8?B?VXduWk9tNXpndFAxekxkaXY2MjI4TzVKblByZ0hYYlRoU0cvR3NUa2NaTFpT?=
 =?utf-8?B?YUJQdU5ibWtzcjRtK1BHMis2RDFOUEZhNHpjN2ZrVkhMUGdWSW1hbW5wWFRI?=
 =?utf-8?B?a2FabnZQdXFCelBWVllVQi9sNTZGU2ZEVlcyL21OaUwzYXFpTHFhalUxVDU1?=
 =?utf-8?B?TkRkOGpGdEkxMHI5aTFCc2tNcGpSVlFtRmd5Mlk0T21oTzBTWjBKUHhqRnlI?=
 =?utf-8?B?ajNZWEw4M3UrYVNsa0EzUHdFL2lLazd3amNyZVdxN3BIU3BIc2RQT25CS3VX?=
 =?utf-8?B?N2NWVlhLM1pXWHVoM0p2TFdpTDBLS1JUUnlFNlVkcXN2a1JEYk1HYlhwNDg3?=
 =?utf-8?B?WXFRbmxGdHdJc2xDYVB2ZFNMcWFVVmdmTGFpd2FwUDBuZmdZS09QUU5mK1dy?=
 =?utf-8?B?cGtSbjVObkVqUkhjdE1RakNEUzVIb3Qwc1IrYjgyMHh0d25UdExtdGNjRUph?=
 =?utf-8?B?akpZZWg0dnpONDB6QlNVUFdCankxTXUwbDFoNEptVmw1VU1FZWxjVXNvbEFI?=
 =?utf-8?B?YnF0Wmk3SU9FcDdaVVpCZm9WdzRqUDRaclpLUStTNStGeHp2YjBmRzZjQXNm?=
 =?utf-8?B?N0p3Z3JjeHVPVm9TZVFZb2J4ZFc3MUtwb00zOGt4eHFmbER6SlIxdk4rMGdZ?=
 =?utf-8?B?dWd3NmFWWW5ETXFWMnZvREs1TzZ6dTNyeGNiS25GamhzTkRQRk5EOFAzUGlF?=
 =?utf-8?B?NDkxekxaM2RNRGNSWmxHazZ3bi9GWndYdlN0ZUc0dklGek9kWS9KS0ZOeXhj?=
 =?utf-8?B?Vmsvc3htTWV0Y3o0ZXVXV1pleUZoRWg1bWlMSHBlMWZ2dVZBYlZtWU9RSVdj?=
 =?utf-8?B?MEN3T2hLQmdqTkJtWWZmUjh5UkdRWjFZek1VZ2JrdjVYWDVyZU82emllSkRm?=
 =?utf-8?Q?NsXtwvkSb3q2mwq0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12c8c99f-b750-4949-8b3f-08de79202437
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 12:26:48.8419 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OB6xxzU0RZHmj2fVmHgSl9pQlQ0mnRxBGVydWedJexibmMuFMAW37i5B85TTuBAARM2lqMwhVx56QJcAk2l+E3j/oJki64D0ECn8kUS8Kmg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6569
X-OriginatorOrg: intel.com
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
X-TUID: KYJRmHWp5qbd
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
X-Rspamd-Queue-Id: C8E722043F7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	DATE_IN_PAST(1.00)[28];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[sebastian.brzezinka@intel.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:intel-gfx@lists.freedesktop.org,m:sebastian.brzezinka@intel.com,m:andi.shyti@linux.intel.com,m:christian.koenig@amd.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sebastian.brzezinka@intel.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:dkim,intel.com:email,intel.com:mid,amd.com:email,gitlab.freedesktop.org:url]
X-Rspamd-Action: no action

Since commit 541c8f2468b9 ("dma-buf: detach fence ops on signal v3"),
fence->ops may be set to NULL via RCU when a fence signals and has no
release/wait ops. ttm_bo_flush_all_fences() was not updated to handle
this and directly dereferences fence->ops->signaled, leading to a NULL
pointer dereference crash:

```
BUG: kernel NULL pointer dereference, address: 0000000000000018
RIP: 0010:ttm_bo_release+0x1bc/0x330 [ttm]
```

Since dma_fence_enable_sw_signaling() already handles the signaled case
internally (it checks DMA_FENCE_FLAG_SIGNALED_BIT before doing anything),
the ops->signaled pre-check is redundant. Simply remove it and call
dma_fence_enable_sw_signaling() unconditionally for each fence.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15759
Fixes: 541c8f2468b9 ("dma-buf: detach fence ops on signal v3")
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index acb9197db879..0485ad00a3df 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -222,10 +222,8 @@ static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
 	struct dma_fence *fence;
 
 	dma_resv_iter_begin(&cursor, resv, DMA_RESV_USAGE_BOOKKEEP);
-	dma_resv_for_each_fence_unlocked(&cursor, fence) {
-		if (!fence->ops->signaled)
-			dma_fence_enable_sw_signaling(fence);
-	}
+	dma_resv_for_each_fence_unlocked(&cursor, fence)
+		dma_fence_enable_sw_signaling(fence);
 	dma_resv_iter_end(&cursor);
 }
 
-- 
2.52.0

