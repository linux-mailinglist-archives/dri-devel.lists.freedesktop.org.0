Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA50B20530
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 12:23:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92BD610E41E;
	Mon, 11 Aug 2025 10:23:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Em7lvvz3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACAFD10E421;
 Mon, 11 Aug 2025 10:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754907807; x=1786443807;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=f0THywZApF7ZqlmZ1wT1IpOMBBkQ13fCLADvglOpsv0=;
 b=Em7lvvz335aP3uFYx3V1bY+vKrJ9ekmt/XsiQFyPidD/RIYkNxKBACKs
 TpFQ25zwZr60J/l7/l1lD6ZUQ2ssF+c0plcOFgP1EWynLOe/j3f+aWePr
 rltVjVooD+gar8/XDAraI07hSGymUDA4vfndh6LFZYPx7eYnHFQalzjv3
 xQ/P2Jcxc+5B0J01KTXQzHpFqgb4Bj9H4QoYiA8MZaO1oitNSVj4fNS4e
 NMBeuH4bpP3dHQTzssf1ay9XQAwL/pQqLrWe79rxs9V0u6+kQvhL+lO+U
 gI7ZjFXqg+7SAWjvb4iCQ7nkKUejPIlGa4Vqmor7yanI7QBgjpVHA2V0h A==;
X-CSE-ConnectionGUID: cKp/TNdFS/K8YhsmzxJAKA==
X-CSE-MsgGUID: rft/ZdguQBSjmFTT54AYAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57113451"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="57113451"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 03:23:26 -0700
X-CSE-ConnectionGUID: nC7zINVlT1CRnM1RsfQfBQ==
X-CSE-MsgGUID: D/WDfd5kRQ2GsrB//gwcSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="166241380"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 03:23:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 03:23:25 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 11 Aug 2025 03:23:25 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.47) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 11 Aug 2025 03:23:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vXP4lt9eMN5NtwiaijXmgICUCAg9oJs1wJ3JNuTIW7RIHavGzNIG1yd/uH5/Ni8RxkN268oFipkJIzkzmwOSnIooW4BXj7SrYJk2qGiFwvd413sjw22BPvXaDoDAWZe4UGjgyTdjAPYMWNMm4OJ1+6dl9QQ9mFIx2foB1OqPtjJVRqhIIdGTO/37+M7AHlkM7MkS2lx8WEA3oIAeFZAIuTy1kRq357sJ3joBrpefYznkw94B2O6dQUlXZ+jc+5oSIeBOZcVFO8oUpclAYr9OhLs0O2FF99zSVqtBka0ZFz6tlq4I3ruvbmqPmE4Azx1goflTUt05yt8YjNxifkdTtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f0THywZApF7ZqlmZ1wT1IpOMBBkQ13fCLADvglOpsv0=;
 b=BgDuR4h9EVLbYJhCFo/kvDreQZLfLyacJwrSphoe+/5oHGGARiqryUbgHINF9htupL189FwbZg2mnF69JGi0yLkjgE3xarYzrg1Q7wbNjFciZyZN9GnehYliaVb3kOzLSaGxGEYWgrgX4YhVjlXAWxx0aIBLX8wNWFDL4F3YZeanCEUePL1L2+MPFj3bRCh/ixzdBgLfI/0Czrft6VcrfYzNP2Bl8Kx9mHiT0Zd9T9kt2fHUZyiHFjkr/IhQ1eQV+Alc0Q8EAx+g3Uvqalln9seZnk4pE0LyXAsEYF7hROeLKiRZkr7G9YN7irdVhB0SYpYfGKG9cOJncyuRKFtqNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 DS0PR11MB7580.namprd11.prod.outlook.com (2603:10b6:8:148::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.21; Mon, 11 Aug 2025 10:23:23 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6%4]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 10:23:22 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Xaver Hugl <xaver.hugl@gmail.com>, "Garg, Nemesa" <nemesa.garg@intel.com>, 
 Harry Wentland <harry.wentland@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, Liviu Dudau <liviu.dudau@arm.com>,
 "robdclark@gmail.com" <robdclark@gmail.com>, "lyude@redhat.com"
 <lyude@redhat.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 00/10] Introduce drm sharpness property
Thread-Topic: [PATCH 00/10] Introduce drm sharpness property
Thread-Index: AQHb++YnbuMoJ+bgIECzE+nDL2OA8LRdReMA
Date: Mon, 11 Aug 2025 10:23:22 +0000
Message-ID: <DM4PR11MB6360D810DD626958CDABD247F428A@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20250519122644.3685679-1-nemesa.garg@intel.com>
 <CAFZQkGyRi310n967Mzq8qZ_DUTJeWx8tWks4XQAUxfVeOx65Rg@mail.gmail.com>
In-Reply-To: <CAFZQkGyRi310n967Mzq8qZ_DUTJeWx8tWks4XQAUxfVeOx65Rg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|DS0PR11MB7580:EE_
x-ms-office365-filtering-correlation-id: 685ad736-3ddb-44a8-8919-08ddd8c119b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?YTh3T3FDRGRaMjFaZ2wxSk9kSi8xNVU2T3Zoa2dWZFRIYXRKNVhsSlNuc1RK?=
 =?utf-8?B?M0hUQzJWWmpGNUJJM0IzcklCWWppN2U0dE8xOFZQUWg2OE1qUGdBZTVIMUVa?=
 =?utf-8?B?Rjdwb0M5aGlPVk9CMGNybXNYUSt4UVpSY0lZZk9UeG5Iek1iYUp4Y1B3c0Ez?=
 =?utf-8?B?V1ZMb3gzbmpzUEp0ZG92dzZvcndiSHRWN0gvNXdqczFOL3pRSm1KSzM4TndU?=
 =?utf-8?B?V0w3YlRQaGdoa2w3eXZRODYzcnNYdFErWTdKV3poN0tIV055b0o3QlRaOGxY?=
 =?utf-8?B?OTV2N0J1T0VZMmpzdWRGcW9EV2hBckVhNkJjb3ZlOWZKTi9XSk5EcHRDY1BU?=
 =?utf-8?B?K3RRRlNoSDRiclpyWjBXa1RsMFJMeUJaRE5DSDBsTEl0MU5DN3ZvR0Z2Q1pW?=
 =?utf-8?B?d3RMcmQrN1R2K1dQT09oV1g1YlVSRUNhT1VqWStMM3djazV1MmhNZ1I5Sytz?=
 =?utf-8?B?ZDNqM1dyTmtJUUg5eEhialpzNGVmY2VUWTNmSGdnYURDQW9BTWFiMC90b01F?=
 =?utf-8?B?TWxlZ0wyb0tLQ1BqTUt6dDRua0YzUUFObTROWHNlaTZUMHFrSWE2cTdHRGUw?=
 =?utf-8?B?Wis1MnRmVFc4bDRQd0I1QjRIc0YzYnYzcUZ3NXRzQzVoekhETkRoZGpheWNH?=
 =?utf-8?B?TmVPbW1rWVIxRjJOWFJqZlRoRWN6TUdhYVhQYUhZdHJ2cjdKN2JVTFErUjZo?=
 =?utf-8?B?VmM3RlE2cmZXK0phRWRsVFpGcy8vTGErU3hUN1h5bXYxY3c5TXMxVlhnRmF1?=
 =?utf-8?B?ODRuS3lBT25ac045Smg2d2p5TFRqbGloTXZTdTVqUmpMMGF3c0dVM1lYTjh3?=
 =?utf-8?B?WGFsb0NXZ2xidTFKczJFOGh1NVR4L1B5bTFkREVpLzgzWkthMjliR1ZVbU9a?=
 =?utf-8?B?cmkyUThicnNqZzRBbS9wN2IwNk90cFVDNUZsZDNkbXU0dkRJa2duQ1hOeHFx?=
 =?utf-8?B?d00ybFBNMUJiZjhTRGZLN2xnWVNpb2tDaXFpK2pvaFJzaHFzYTkwN202SHlH?=
 =?utf-8?B?K3J5NU5taUZMSEdNeWxhSGFZcEQ5NUYzWWtva2JxaVIzUFZ0Y2dhNFh4V2wy?=
 =?utf-8?B?TVJJZEsrT1BkMmROZ0FvTm1sLzJ3NDRleGdRL2VVUHRJMW5ScWk2dnhpM3BL?=
 =?utf-8?B?bmMvZEZVMUNPcUxvZk1iTUhSNi80bnVCbzE0ZmZLWVFSejZMSkRhYjB3aENI?=
 =?utf-8?B?eWZONlp0aDI4Y1pkdmtIVWVWK01kK2JZckkrZEpDSEVwU093UE96LzhDejZJ?=
 =?utf-8?B?d01yUE11alVnNWJVL2NIVXRLaTlKWE10eWxkalBBdzc0cTBWemRicmtLeGVI?=
 =?utf-8?B?ZWtBYlplcVovU2NDUENHNlVkTlJPeVV4Y1hWNEZvdmN1b3liTnNjc093TlpD?=
 =?utf-8?B?OVJKZ001b0RVVlZsclhMMFU4bkE2b1pQRjEySUtqcnM2azVidDVibmg5S0Vz?=
 =?utf-8?B?UmtIQzdZMVJ5THl6S29WeGllVUVaamZ1d3dZVHQrcDJZRlI0dE4xYjYrR01r?=
 =?utf-8?B?MWRrRFp4eUdoVzVJcmR3b0QwWUVuWmpRRy9XdWNDc1I1NjhIS0dGOUQrZ3Rr?=
 =?utf-8?B?Q2szMkRhOU0vaFRKRkNmZndRVTJhMENGaGVyVXh6VjFEQktjcXN4VnNGWkl4?=
 =?utf-8?B?MW10b3hMVURlOW05bVRRUVJKa2lhSTVhZ3YzNHZwWTV4QnJmVjBXMmVRYThR?=
 =?utf-8?B?amxBUlUrb3M2YUorZkdoc1MxN0kvSGpNMG5MWUF2eWg5N09Rem9TdFVRVkh6?=
 =?utf-8?B?MjBzQW1NL0VFOWl6YmRkM1RSMVBXTGFSNVFxUHVkRWVBQXVUQjJINXA3SldE?=
 =?utf-8?B?STM0OEp4Z21YOWEzdlM2RGpYb1NVNngyWmFNdTBQWTR5M2laeW9hbEpmWkxt?=
 =?utf-8?B?dXZSUUdlOHVFVU1wK3hSeXBPeUxlT3E3QTYwZmVNckFHVGpaa09LdmVMRjlL?=
 =?utf-8?Q?2ptV2s2r6vo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WnBmS1JoVmNIVFhsbVorOENpY0wydjhNS0tvakV4ckNxcExWY3g2ai95bXlO?=
 =?utf-8?B?VE5KYUFCOFozN3lxUTYxd2tvcFFnaVJLRjRQVjFFYW5BRHdRVFVWVHlZd28x?=
 =?utf-8?B?dlNiNnhmYU1pa2tUMGVLUDRKYm9aRE1pKzhDWmMyTWVkUmdON1N5NDA4M2Q4?=
 =?utf-8?B?ZWZNTnZmQ2JrdCtjcUJEVUZPVWtNS05pY1kzZU1BSlJPbnMwVEtSUWZhTlR0?=
 =?utf-8?B?d1dEOHROUEh4MTVtdHJDTFdaL3dlbmZ4WU1vejZBekZVVkZtVk9DbUc0R2ZQ?=
 =?utf-8?B?NVgvZjNNM3BzeFRqZS9GdGpXcGdqZFhYY0JDQllMUGpiV1hKakI3NmtrZ05F?=
 =?utf-8?B?MEJjM1ZTbzZjWlh6cUJNK2lOSkc1WFdNbzBuck03YlR6dFdhenV0SUFqaG9V?=
 =?utf-8?B?KzNGZllRNGhOM3NkUlU4eGlCN1A4SEc3QlQ2Q1NKVlJRSytJSk1NdXA5Nits?=
 =?utf-8?B?U2d4OGZRdXFDRTNuTXJGVW1YWUtGTFBHMkwveGZtcmZxVDAzeW1FbnJFeFZz?=
 =?utf-8?B?YkxyZzhROVVYb0lkMFNWd2lHQTBydjd0V2xWK3Q4SDViSWJIZjJTT1FERm5T?=
 =?utf-8?B?SG9HazhwMTNTaURUOHU1STVmaVRocTZaT2lZR2FMYm1qMmdqRU9BVUcyMUdG?=
 =?utf-8?B?RitjaVN2Z09xNUNyNkcwVjFlUXhGZnA4Q3IyOEtCSmI5VGw3VU5rV2FmZUJr?=
 =?utf-8?B?d0dCZDFvVXB0UXZmVHNUY1ZyMnIzanQzZXUrdWZhZElEdGUxd0lMc0l6aWNY?=
 =?utf-8?B?RjhJR2xoYmp4elFFVU9WMWFtRFl5RkVLKzZ2azlTdzdZUFVsYXVUanpRMnpG?=
 =?utf-8?B?TkNERzkvdTdzdVU4dGJ6RjJvcDZhdDBzNVJvUGVLbmZKZUcxbmhUeHM5cFNJ?=
 =?utf-8?B?bUUwMUZPNU5vam1ydjgrcDY5WTViWEh6ME5qN21mbGtuMmdzY2xaUXg2alhi?=
 =?utf-8?B?SXZyQWg4MS9FWjFYcDNBVU4wbHhmRDlpZEZERm54OGhPbTk4bW85c2wyalFr?=
 =?utf-8?B?Sk9rdnphSEpiUmYvMEZKMlBoSEdzK2VqUnNBZmJVK1BzblVPZWk4Z0dHSjJS?=
 =?utf-8?B?cUE5b2JSRDc5ZnJmMmNEWmMvZHZDZ0h6YnNqV3hGR0hleHdWWTF5OS9ycFVV?=
 =?utf-8?B?QlREbnUxNkxOaU42VEtCN0VPUjlGdE1GNUhrTEkvUHo4aVovVlMybkJ1Mkpn?=
 =?utf-8?B?M3B5YVNNRnhENEJGblRYMEY2ajdwK1ZFMW9BOWRZSzJoVWE4ZlVKUjQ5aGs1?=
 =?utf-8?B?cHNnOGkzNEY1R1VWQkxUdmVPdldJOE4xUU1IVmNXY1NIYWExUWtjZ0p1cmhT?=
 =?utf-8?B?TXh4L25aRlIwVDFPRU9Ocy9Lemc3d1ZRaElyV2pacUZaZ00wQS9sUm1QOEJx?=
 =?utf-8?B?eEM3REhBTGNDVjlLS2dFS1VnRnNndmRtOWlJVG9RUlg0Nm1BWkJCaHU1Tmdh?=
 =?utf-8?B?T2dLMkRQRTlIc3JiUXdIWEx4dzNGbDRKUEtCdXlybEgxK3hRZEJqWTNLM1Mx?=
 =?utf-8?B?cklCNjFTTVBsbXFOWmxPbTFtTElzVlVDZzF1RTE1SnVNMTdTTVlSbDdUaGFn?=
 =?utf-8?B?UERlc3ltSU5qSXVNNjdlRC9MQ0xxNEZvbUxndFRQSnZ3ZDFROG4vUk9ENStm?=
 =?utf-8?B?ZHRCV3dPNkc4STlJOHB5eXNwcWxjQXFMTnVuSFFENlhVcEJMdEM5UDFwVU5q?=
 =?utf-8?B?SmdhV2p2d1lZR2Zwbk1ieTNtY1FkcmEyeWZtRjVtN0VsQ2lrem9KWVZ2RzZ4?=
 =?utf-8?B?dkhPVXdjblBLcy84dnlwS3lWS0NwMG1tbGMzcU9tUWVzYVZVaUExdmREQzZV?=
 =?utf-8?B?RkhGSENuc1RPNGVxeUpDU0hFcVJ4Q1BZeWN1dGxtVUVBNnhKbnExMnBXMDVv?=
 =?utf-8?B?MHhadU9razMxQkgrRlJ5a3AvaFNWNXNobG4rQ2tKRVUxcHdRRlRLWUZWcXZq?=
 =?utf-8?B?MTFRdVBQRXRIMmxUeVZ6cElLdWJ3TDRtejg5cDZIRHNraElZakdlak5vdDA1?=
 =?utf-8?B?eHdRVnNrN2lBc2htdEZDNkJ5S3F1aTN0KzhaT1lGQjlKamw4NEZvSkwzdmVp?=
 =?utf-8?B?by9aWFk5TEFXZFBLajJSaUlPT3VhbTRkdU9TOTg3N1QyYjFIU2twSENrR0Fr?=
 =?utf-8?Q?SqnNAGYIHmPbHQWNM8rjZhnjZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 685ad736-3ddb-44a8-8919-08ddd8c119b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2025 10:23:22.7151 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8bps62MPFvkKS3EzexAgJjO+ks1Q5IaFYVVn5aCznW7p9yMgDgXWv2k2omRbqK7apssTboO/FdWJGljS3bZjNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7580
X-OriginatorOrg: intel.com
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogZHJpLWRldmVsIDxkcmkt
ZGV2ZWwtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBYYXZlcg0K
PiBIdWdsDQo+IFNlbnQ6IFdlZG5lc2RheSwgSnVseSAyMywgMjAyNSA4OjU2IFBNDQo+IFRvOiBH
YXJnLCBOZW1lc2EgPG5lbWVzYS5nYXJnQGludGVsLmNvbT4NCj4gQ2M6IGludGVsLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmc7IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJpLQ0K
PiBkZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAwMC8x
MF0gSW50cm9kdWNlIGRybSBzaGFycG5lc3MgcHJvcGVydHkNCj4gDQo+IEkgcmV2aWV3ZWQgdGhl
IEtXaW4gaW1wbGVtZW50YXRpb24gZm9yIHRoaXMgKGh0dHBzOi8vaW52ZW50LmtkZS5vcmcvcGxh
c21hL2t3aW4vLQ0KPiAvbWVyZ2VfcmVxdWVzdHMvNzY4OSksIGFuZCB0aGUgdUFQSSBsb29rcyBn
b29kIHRvIG1lLg0KDQpUaGFua3MgYSBsb3QgWGF2ZXIgZm9yIHRoZSByZXZpZXcgYW5kIHZhbHVh
YmxlIGZlZWRiYWNrLg0KDQorKyBNYWludGFpbmVycw0KDQpUaGlzIGlzIHJlZ2FyZGluZyBwcm9w
ZXJ0eSB0byBjb250cm9sIERpc3BsYXkgU2hhcnBuZXNzLiBTZXJpZXMgbGluazoNCmh0dHBzOi8v
cGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTM4NzU1Lw0KDQpDaGFuZ2VzIGFyZSBp
bnRlZ3JhdGVkIGFuZCB3b3JraW5nIGZpbmUgd2l0aCBLd2luLiBNb3JlIGRldGFpbHMgaW4gdGhl
IHNlcmllcyBsaW5rIGFib3ZlLg0KDQpDYW4geW91IHBsZWFzZSBjaGVjayBhbmQgYWNrIGlmIHRo
aXMgbG9va3MgZ29vZCB0byB5b3Ugc28gd2UgY2FuIHBsYW4gZm9yIG1lcmdlLiBMZXQga25vdyBp
Zg0KYW55IGZlZWRiYWNrIG9yIHN1Z2dlc3Rpb25zLg0KDQpUaGFua3MgJiBSZWdhcmRzLA0KVW1h
IFNoYW5rYXINCg0KPiAtIFhhdmVyDQo=
