Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEI6CXU4o2mU+gQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 19:48:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8084D1C6465
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 19:48:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A38710E02B;
	Sat, 28 Feb 2026 18:48:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="Nf6Z32gn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazolkn19010006.outbound.protection.outlook.com [52.103.43.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18DD210E02B;
 Sat, 28 Feb 2026 18:48:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VS+mJ3iWq9qiFAYFMMMI7q4MQKeIkXmc/7J7XM2xvYRZJxo79xLArBXcG2H6DM7oPyqFOU8KT0sv2/1VnFv52pIi34McWTUIAV6GL+AOisIqH/kYSwdvlF09AyluAmXOJ0WPim/r02MLDH+vwMydk/8OBxN+C7LZMaO9PeCqRdaDO0mo2eX3R5GP7peBdGqUWFsMXCWdeC/yrhkHpRFfze7j/56i8/0ETpRtKHZNoH9QJejjQiH94abSD4iarx3SMgcLSre/cZTILTLAIK6PIpwLa7A1ewxgJrEBzkdpz04EVBUALqBfNKYhgew8zCFnqedPcPZ03yljd6XTPh0u+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VeUcppc/8+QKuvx3CSaFiwiI5TbaFVIPp0Ygjrlz134=;
 b=yK71yGclt3+iWYtUk43veWn8VU0uAwP0rRdEFHBDAVplN2XP2RjMZSlLXY0Kz0MB/NNB3bQOBLdyBc5yelyQkEJpDSlb9RBJB6yre3SdC6tOlCNzQ2ko7Yq+neF0SMGoRtDbrcbZ/TmeYq7YBGbUyTaCMP2mnQwY2rNBV4bEWLCM7OGCHvPEin89e/CPoE/dz955SKSCEE1UdJGooPEMHhHGCoK2JBsp3A/BBI1qWCtTxaQxM+Kb7pzuzoxEmacEQBmDLdiQErpqfVNVAiRM0VTnrlBB8M9nosQINxICbJLF7CO1M8n1fqNPf/9AzvNZiooue9TLk8Sqme92SuU7eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VeUcppc/8+QKuvx3CSaFiwiI5TbaFVIPp0Ygjrlz134=;
 b=Nf6Z32gnfqtrmJoxyHy/NCE721LjUAHSDbs6ocweLA+J4Nr1rCQeeUC7vWQCdZByyF+AMaJhYs+nb0k4/9C/GGMLbH4tZzrMvPI/OGFpLD/yd+eIDKXFCTWk8lEYr8sqMFvaRs2uze+5LcdVT8FQcOU6SB59wqU8F/u1qt73Z4IHqporJHlmhvx2sQ2k4e/wObLOEHKVtj7HgxdZk84k7n3Pbd/A5xSX2uxVPyaNvwGuGZ0IX1ITtyVfgLKMylw+uRyuUTRMWZsqfvwK+Q1zeaCFiSI8rwdOH8gJlVgZxMtcJi0YPgDj/CBq8rtMDb6Ww6ucn8L4LmUAdEXLJpqEsw==
Received: from TY4PR01MB14432.jpnprd01.prod.outlook.com
 (2603:1096:405:235::10) by OS9PR01MB15458.jpnprd01.prod.outlook.com
 (2603:1096:604:3c0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Sat, 28 Feb
 2026 18:48:09 +0000
Received: from TY4PR01MB14432.jpnprd01.prod.outlook.com
 ([fe80::de2b:6c81:9bd7:99c2]) by TY4PR01MB14432.jpnprd01.prod.outlook.com
 ([fe80::de2b:6c81:9bd7:99c2%6]) with mapi id 15.20.9654.015; Sat, 28 Feb 2026
 18:48:09 +0000
Message-ID: <TY4PR01MB14432D0EC9AA59EBFD5461B479870A@TY4PR01MB14432.jpnprd01.prod.outlook.com>
Date: Sun, 1 Mar 2026 02:48:04 +0800
User-Agent: Mozilla Thunderbird
Cc: wiagn233@outlook.com, =?UTF-8?Q?Michel_D=C3=A4nzer?=
 <michel.daenzer@mailbox.org>, Mario Limonciello <mario.limonciello@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Hung <alex.hung@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, =?UTF-8?Q?Timur_Krist=C3=B3f?=
 <timur.kristof@gmail.com>, Ivan Lipski <ivan.lipski@amd.com>,
 Dominik Kaszewski <dominik.kaszewski@amd.com>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] drm: introduce KMS recovery mechanism
To: Hamza Mahfooz <someguy@effective-light.com>,
 dri-devel@lists.freedesktop.org
References: <20260220171518.711594-1-someguy@effective-light.com>
From: Shengyu Qu <wiagn233@outlook.com>
Content-Language: en-US
Autocrypt: addr=wiagn233@outlook.com; keydata=
 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
In-Reply-To: <20260220171518.711594-1-someguy@effective-light.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5E30Ek5fH1DMV3arFO6mnuNn"
X-ClientProxiedBy: TYCP286CA0335.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::13) To TY4PR01MB14432.jpnprd01.prod.outlook.com
 (2603:1096:405:235::10)
X-Microsoft-Original-Message-ID: <1e1d2c7e-0451-4681-a562-88a193dfe577@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY4PR01MB14432:EE_|OS9PR01MB15458:EE_
X-MS-Office365-Filtering-Correlation-Id: 6496aab8-3105-49e5-4f15-08de76f9eab1
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|5072599009|12121999013|15080799012|19110799012|6092099016|41001999006|8060799015|461199028|23021999003|20055399003|1602099012|40105399003|53005399003|41105399003|3412199025|4302099013|440099028|26104999006|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MzA5ZDVESlc2aVRZRGdjSllWQlBCWEtTTEJ2aFhnUHoxVzFSeUdlS1NUOXF0?=
 =?utf-8?B?ZU9hVWxZT3hQMENOZVpoK1J2VWRPYUkvMUdiZFE3Y1k0OXVvZzZmUHlkL21U?=
 =?utf-8?B?UWVCb1N5M3dEblI1R1hCOWpHcWVUYzJDRWMyU0NZTEp1N1Q0c1dPaCtPU2NT?=
 =?utf-8?B?ekM0UmlFNFUzYmlVU3hJT0pGWVIrSWFjaFRTT1E3b0hKOGgxSVFyejBUMVE4?=
 =?utf-8?B?ODQxNjRieDcwK3B0ZTRDN2l3WUZScVAvL1IrTEVoLzVmeHM5WlVzV3Bhd1R2?=
 =?utf-8?B?RUhmdHNiSzNTUUttR2RrdmxGNUJTcVNSNTh6WjZjaTVNN1ZzZlBRaWdxeE9u?=
 =?utf-8?B?SUpJbkJzVEoxV3FXalRFN05STEt6cjBWNlJYb2FMcVRSNnpOYWVpNW8vM0dL?=
 =?utf-8?B?TW9DT1pvSlJURVROcGxuN3lybk5WcDVVUEVEZjBkeWV3dHo1VTB5Qm15TW5q?=
 =?utf-8?B?NGVzcFZVYktiejdSQThUSVFIU2pRU0FScUQ4bE5kRkxYSzIreXpZRTVFZHd3?=
 =?utf-8?B?MzNaT29hYjdnSkUzek9LWDU2MTFVTElBSWZwUkVnVXM2MVJ0V3VpVE50dFZR?=
 =?utf-8?B?WFZWZ08vUk5ycCtDd2dHQlFCT3ZBSDArMFZLdEM2K3Q4T1QyV3lTVEg2OTZL?=
 =?utf-8?B?NjRMN3hxYkdDbVJ2NG40TWZrTi9uZ2VPZk1EWDRRcmxHTm5EMmowZ3E1WEJV?=
 =?utf-8?B?UXVkU2MxNTlTSi8xVklJK3oyRUVBL2loZStRUnlsU2hFTyt0aU5KV2cwdmJJ?=
 =?utf-8?B?V0RFSTdmOVlxS2JKd1RKUTlPZElURnVhY0FOSUJaT0thSXMwakdPREJZTmI5?=
 =?utf-8?B?MVJmZ1UyZzZjVWp6TENxM21PUUtManVIL1l5L3pPZHpJUjNGekxZcVdQY1FL?=
 =?utf-8?B?ak5KbHpTY3I2RS8wVTQyTFo4MmVmNHEzZVliaWVnWnRWYVB3eVhTS0JFL0hk?=
 =?utf-8?B?Mjh0MWtub2taZ0JER21DU0lSMGlwRzdzOWNkTHNQYzZkclp6eURKWmV5R0R2?=
 =?utf-8?B?YnV1bTBLNUV3Wlg0aWZLeThYOC9JcC9CSWs4VVdsTFpFUnJqQXdFdFZWRTI4?=
 =?utf-8?B?WFhxQjdhOWtFeUNZQWZoL0x3SFRxeHpnUFpzMkFNMXVaaVhsQmdMcUoyckpa?=
 =?utf-8?B?Q1kycS9SL0szK2tXQzZIRnkrcWpmRWg5YnhKeG1nNUljRWtQWlBXa3I5YzBt?=
 =?utf-8?B?V1l5UFVEdVZQSVlRQ051VnM0YXMrVlFnRGlDSWtuaVZDYmRTYW9LN3NveUlT?=
 =?utf-8?B?aEZILyswZ1hwNWkzYTlFSDFESm5hRDJrbHZnV1laRzgrOW04K0lOT3F6Y1l3?=
 =?utf-8?B?ZC91K09XQVFqeUJqSFRzbDhUOUFOdDJYTFJxM3ZFc095WnQ1YzJlYW9teGE5?=
 =?utf-8?B?M0VqODd3bytzd0VFV1hPMGV1clhnSVZCdVVFM212QU9GTFlhejJ5TXpZdnVF?=
 =?utf-8?B?cDlybTJ3SytiWFd2NkgzY2RHNWpKdGNpNEJqcDcrYk5TRW9LaUhRdWQxREw3?=
 =?utf-8?B?ZHZTZXB3SDY4QjFWdm5WVnlHenNqc0Y4MnozTG5LSXVVMk11VWhmOFkyZ0I0?=
 =?utf-8?Q?2YfXt0jb7E1LYLiM61amJljNA=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cE9SOWpRRmNmN1V5UjlTb2ZyU1NJY1AyRWVUaHAzN1VPZTBVTzVxSjJnbEpo?=
 =?utf-8?B?bTNMWlM5ZkhMOGtHSXhidEFwOTNuSG9BRnB5VFQ1VkdXd043Q2dBNlBNeWJH?=
 =?utf-8?B?QS9HbkRJQ3B1dE5PaVAyWUN0MXFIYUpQbGM4d0hpVlRzSEp6Sk1Hb243blp2?=
 =?utf-8?B?TmNzVjNpYXFYWjFIdFNUbmpHUUQ3SzRHS3RCM2p0VGJBUHA5eXFTWHAveHhS?=
 =?utf-8?B?MU1iQUNFRnZlSlB5bTlGa2xqamd2dmtnZGozQTI0YS9zdnpmQ3NjUlMxbG85?=
 =?utf-8?B?cGhMMGM2V0diYWhVNlJ1TkFoOWZZZ1JYV2xCS2FCWExXOHVyQzFHaVNVcEdU?=
 =?utf-8?B?TDRTQng0MGNpUktUYTRCSWRRRVgwM2JQZlFPQ2pZTGpwMUFRWHdoNm5qb0xs?=
 =?utf-8?B?bm9SSWVoVjg3SS9RdElXZ3ArQzhUV3NyNXpDK2RtVWRuWmlZaVU2NHR6S1dk?=
 =?utf-8?B?MXhQSUpsODNKSXlFL1NoYnp0d3JhN3N1cFEwSC85MkhzVk9OL2NlQWZSTVJZ?=
 =?utf-8?B?WHJVdEZCR3NMc29RbWFNTk1CK1ZSYi9VZGU1c2lUMWVzT25tRm5HM2FiZW1J?=
 =?utf-8?B?Q0VlZzBmK05kVTNxbmRjMEcwWnVGMFhoaFRYNjRKL2VseldKZUxoaXRNR0ov?=
 =?utf-8?B?OXpEaVZHbkNoRWlONTgyeUpiR0M2NjBLemN3RTVmL0VXZXNDTkhVZTM0N3ZQ?=
 =?utf-8?B?a292bGYwN0U1b0ZnbUtFM1kvVHdWNFJnUDVEZHRrUHY5R1c1N3ZUM1ZHYlFa?=
 =?utf-8?B?UkMrL0loRUpHZDI3Y2lkc0g0ZTVkZXdWdGhxR0RBeUY1VkpBc1kzTlg3UmRF?=
 =?utf-8?B?QlY5bTE3R0hiNTYzSEttMGw3SHlFWmg4Ukxub3BqakhuTFhPOCtZbGdWMnBu?=
 =?utf-8?B?dFg1MnlONXJhajNOWjJTYWN4M2hVL0VObXdMdmtOUjRKaStDQW4zUk5iNDJj?=
 =?utf-8?B?MnlsRWVvenRUZDZKVjJvbmlMTGVqdGlFZHpXaE4yR3AzU01CaG8yT1p2WGwr?=
 =?utf-8?B?UjR2S3YrVU53akNKdGZzelg1WUg5M0ZybDJuQ1R1THVNWTFCc3JOUGdMRHk3?=
 =?utf-8?B?T1BGMjBBWXdMZnArWWtxcFJYOHl1NVNvc0tDeENuM1lQT0QwVnBQZ0hyWS9H?=
 =?utf-8?B?N00zdTZDeGZ6WldjK3dCbXkzVjhmVjM2Unh2ZFVqWUprRlhsSGE2VE1JcHRa?=
 =?utf-8?B?VHd3WFV4eVA1ZDRWOWpmTHNEeVRDeWxsNzFKKzhmNHl0RmRqT3g2TVpwa1gx?=
 =?utf-8?B?eFZVbUxhUkYxMzJJT2dOTHpHdEpjTmdLbjR2cUJ3K295dTFDcEg4eGFjVEFG?=
 =?utf-8?B?QTRKZ1V5d2NPd3BaMHlxMXVUMnRPOEQ1YVpIUEVQQktOU2xDTzRXbTRuQmZN?=
 =?utf-8?B?WWhRa2d2T20zR054N1JvUlJubFFzVXkvWXdCanEvRzl3aytKNFJ5YklBTThY?=
 =?utf-8?B?VFN2UGhnSHMvUHM4aFI5Ny9uaTBMVzN5YzlTYzY0ME9BY0lQSEdQV0xDZUpl?=
 =?utf-8?B?WnpHMlViZWhHU0ZpQ2VpTnlIekJHZGlobDgvNFlKWVRpSzRNTjUzU01jS2NS?=
 =?utf-8?B?NkcwNmdlSGhNT2xCUGtsT2Q4WGFqV3lPRldVUVRwZ25VTngzMlpRMlVoTHlP?=
 =?utf-8?B?Y3FRZkhKY3FMZkMvTkNGVWZwc2RwTmVIcEw1U1ZUaGR5MkxGbjhjMEhPR1Yy?=
 =?utf-8?B?b245R0dVYzcrNzAvTUlmR1h6NzhhdlFEam9GRy9KWlZFWWZDUzRVVHJwMFBp?=
 =?utf-8?B?QWt3dDdkME1Ya2pRcE4wbGc0ODd3czdEd0pVc1FreHppQzBLbFFOdDFwUEV0?=
 =?utf-8?B?Q0VKRWJWL1BUMXhicklIbkZiMjdMeXlneGFoUkMvNzNlZDVtV1RPWVBzYjdw?=
 =?utf-8?B?WDcyTTcyQXhDc0gxNFNlMEFPazhBc1Y2ZTlXTlB1VDF2WmJsY1JZZlIzVkdF?=
 =?utf-8?Q?p5xwhBZr4aAfOBhQUWbXufo4Mb8RkIbt?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6496aab8-3105-49e5-4f15-08de76f9eab1
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14432.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 18:48:09.2840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15458
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.71 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_TLS_LAST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	FREEMAIL_CC(0.00)[outlook.com,mailbox.org,amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[wiagn233@outlook.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_MUA_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[outlook.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FREEMAIL_FROM(0.00)[outlook.com];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 8084D1C6465
X-Rspamd-Action: no action

--------------5E30Ek5fH1DMV3arFO6mnuNn
Content-Type: multipart/mixed; boundary="------------GuFw0J0B80x7J0Fp9uEV2uaQ";
 protected-headers="v1"
From: Shengyu Qu <wiagn233@outlook.com>
To: Hamza Mahfooz <someguy@effective-light.com>,
 dri-devel@lists.freedesktop.org
Cc: wiagn233@outlook.com, =?UTF-8?Q?Michel_D=C3=A4nzer?=
 <michel.daenzer@mailbox.org>, Mario Limonciello <mario.limonciello@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Hung <alex.hung@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, =?UTF-8?Q?Timur_Krist=C3=B3f?=
 <timur.kristof@gmail.com>, Ivan Lipski <ivan.lipski@amd.com>,
 Dominik Kaszewski <dominik.kaszewski@amd.com>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <1e1d2c7e-0451-4681-a562-88a193dfe577@outlook.com>
Subject: Re: [PATCH v4 1/2] drm: introduce KMS recovery mechanism
References: <20260220171518.711594-1-someguy@effective-light.com>
In-Reply-To: <20260220171518.711594-1-someguy@effective-light.com>

--------------GuFw0J0B80x7J0Fp9uEV2uaQ
Content-Type: multipart/mixed; boundary="------------T0xYU47CjgxbjfI3G4uk8Kjj"

--------------T0xYU47CjgxbjfI3G4uk8Kjj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNClNpbmNlIHlvdSBjYW4gcmVwcm9kdWNlIHRoaXMgdGltZW91dCBpc3N1ZSwgY2Fu
IHlvdSB0cnkgdGhlIGRlYnVnIG1ldGhvZA0KaGVyZVsxXSB0byBjb25maXJtIGlmIHlvdXIg
aXNzdWUgaXMgdGhlIHNhbWUgYXMgdGhhdCBwYXRjaD8NCg0KWzFdIGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2FtZC1nZngvMjAyNi1GZWJydWFyeS8xMzg4NDIu
aHRtbA0KDQpCZXN0IHJlZ2FyZHMsDQpTaGVuZ3l1DQoNCuWcqCAyMDI2LzIvMjEgMToxNSwg
SGFtemEgTWFoZm9veiDlhpnpgZM6DQo+IFRoZXJlIHNob3VsZCBiZSBhIG1lY2hhbmlzbSBm
b3IgZHJpdmVycyB0byByZXNwb25kIHRvIGZsaXBfZG9uZQ0KPiB0aW1lb3V0cy4gU2luY2Us
IGFzIGl0IHN0YW5kcyBpdCBpcyBwb3NzaWJsZSBmb3IgdGhlIGRpc3BsYXkgdG8gc3RhbGwN
Cj4gaW5kZWZpbml0ZWx5LCBuZWNlc3NpdGF0aW5nIGEgaGFyZCByZXNldC4gU28sIGludHJv
ZHVjZSBhIG5ldyBtZWNoYW5pc20NCj4gdGhhdCB0cmllcyB2YXJpb3VzIG1ldGhvZHMgb2Yg
cmVjb3Zlcnkgd2l0aCBpbmNyZWFzaW5nIGFnZ3Jlc3Npb24sIGluDQo+IHRoZSBmb2xsb3dp
bmcgb3JkZXI6DQo+IA0KPiAxLiBGb3JjZSBhIGZ1bGwgbW9kZXNldCAoaGF2ZSB0aGUgY29t
cG9zaXRvciByZXByb2dyYW0gdGhlIHN0YXRlIGZyb20NCj4gICAgIHNjcmF0Y2gpLg0KPiAy
LiBBcyBhIGxhc3QgcmVzb3J0LCBoYXZlIHRoZSBkcml2ZXIgYXR0ZW1wdCBhIHZlbmRvciBz
cGVjaWZpYyByZXNldA0KPiAgICAgKHdoaWNoIHRoZXkgY2FuIGRvIGJ5IHJlYWRpbmcgdGhl
IHJldHVybiB2YWx1ZSBvZg0KPiAgICAgZHJtX2F0b21pY19oZWxwZXJfd2FpdF9mb3JfZmxp
cF9kb25lKCkpLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSGFtemEgTWFoZm9veiA8c29tZWd1
eUBlZmZlY3RpdmUtbGlnaHQuY29tPg0KPiAtLS0NCj4gdjI6IG5ldyB0byB0aGUgc2VyaWVz
DQo+IHYzOiBnZXQgcmlkIG9mIHBhZ2VfZmxpcF90aW1lb3V0KCkgYW5kIGhhdmUNCj4gICAg
ICBkcm1fYXRvbWljX2hlbHBlcl93YWl0X2Zvcl9mbGlwX2RvbmUoKSByZXR1cm4gYSBlcnJv
ci4NCj4gdjQ6IGdldCByaWQgb2YgbmVzdGVkIHJldCB2YXJpYWJsZS4NCj4gLS0tDQo+ICAg
ZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmMgfCA0NyArKysrKysrKysrKysr
KysrKysrKysrKystLS0tLQ0KPiAgIGluY2x1ZGUvZHJtL2RybV9hdG9taWNfaGVscGVyLmgg
ICAgIHwgIDQgKy0tDQo+ICAgaW5jbHVkZS9kcm0vZHJtX2RldmljZS5oICAgICAgICAgICAg
fCAyNCArKysrKysrKysrKysrKysNCj4gICAzIGZpbGVzIGNoYW5nZWQsIDY2IGluc2VydGlv
bnMoKyksIDkgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9hdG9taWNfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19o
ZWxwZXIuYw0KPiBpbmRleCA1ODQwZTljYzZmNjYuLmQ5MDVlYjE2NjIyNSAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmMNCj4gQEAgLTQyLDYgKzQyLDcgQEAN
Cj4gICAjaW5jbHVkZSA8ZHJtL2RybV9nZW1fYXRvbWljX2hlbHBlci5oPg0KPiAgICNpbmNs
dWRlIDxkcm0vZHJtX3BhbmljLmg+DQo+ICAgI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4N
Cj4gKyNpbmNsdWRlIDxkcm0vZHJtX3Byb2JlX2hlbHBlci5oPg0KPiAgICNpbmNsdWRlIDxk
cm0vZHJtX3NlbGZfcmVmcmVzaF9oZWxwZXIuaD4NCj4gICAjaW5jbHVkZSA8ZHJtL2RybV92
YmxhbmsuaD4NCj4gICAjaW5jbHVkZSA8ZHJtL2RybV93cml0ZWJhY2suaD4NCj4gQEAgLTE4
NjQsMzAgKzE4NjUsNjIgQEAgRVhQT1JUX1NZTUJPTChkcm1fYXRvbWljX2hlbHBlcl93YWl0
X2Zvcl92YmxhbmtzKTsNCj4gICAgKg0KPiAgICAqIFRoaXMgcmVxdWlyZXMgdGhhdCBkcml2
ZXJzIHVzZSB0aGUgbm9uYmxvY2tpbmcgY29tbWl0IHRyYWNraW5nIHN1cHBvcnQNCj4gICAg
KiBpbml0aWFsaXplZCB1c2luZyBkcm1fYXRvbWljX2hlbHBlcl9zZXR1cF9jb21taXQoKS4N
Cj4gKyAqDQo+ICsgKiBSZXR1cm5zOg0KPiArICogLUVUSU1FRE9VVCB0byBpbmRpY2F0ZSB0
aGF0IGRyaXZlcnMgY2FuIGF0dGVtcHQgYSB2ZW5kb3IgcmVzZXQsIDAgb3RoZXJ3aXNlLg0K
PiAgICAqLw0KPiAtdm9pZCBkcm1fYXRvbWljX2hlbHBlcl93YWl0X2Zvcl9mbGlwX2RvbmUo
c3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gLQkJCQkJICBzdHJ1Y3QgZHJtX2F0b21pY19z
dGF0ZSAqc3RhdGUpDQo+ICtpbnQgZHJtX2F0b21pY19oZWxwZXJfd2FpdF9mb3JfZmxpcF9k
b25lKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+ICsJCQkJCSBzdHJ1Y3QgZHJtX2F0b21p
Y19zdGF0ZSAqc3RhdGUpDQo+ICAgew0KPiAgIAlzdHJ1Y3QgZHJtX2NydGMgKmNydGM7DQo+
ICsJaW50IHJldCA9IDA7DQo+ICAgCWludCBpOw0KPiAgIA0KPiAgIAlmb3IgKGkgPSAwOyBp
IDwgZGV2LT5tb2RlX2NvbmZpZy5udW1fY3J0YzsgaSsrKSB7DQo+ICAgCQlzdHJ1Y3QgZHJt
X2NydGNfY29tbWl0ICpjb21taXQgPSBzdGF0ZS0+Y3J0Y3NbaV0uY29tbWl0Ow0KPiAtCQlp
bnQgcmV0Ow0KPiAgIA0KPiAgIAkJY3J0YyA9IHN0YXRlLT5jcnRjc1tpXS5wdHI7DQo+ICAg
DQo+ICAgCQlpZiAoIWNydGMgfHwgIWNvbW1pdCkNCj4gICAJCQljb250aW51ZTsNCj4gICAN
Cj4gLQkJcmV0ID0gd2FpdF9mb3JfY29tcGxldGlvbl90aW1lb3V0KCZjb21taXQtPmZsaXBf
ZG9uZSwgMTAgKiBIWik7DQo+IC0JCWlmIChyZXQgPT0gMCkNCj4gLQkJCWRybV9lcnIoZGV2
LCAiW0NSVEM6JWQ6JXNdIGZsaXBfZG9uZSB0aW1lZCBvdXRcbiIsDQo+IC0JCQkJY3J0Yy0+
YmFzZS5pZCwgY3J0Yy0+bmFtZSk7DQo+ICsJCWlmICghd2FpdF9mb3JfY29tcGxldGlvbl90
aW1lb3V0KCZjb21taXQtPmZsaXBfZG9uZSwgMTAgKiBIWikpIHsNCj4gKwkJCXN3aXRjaCAo
ZGV2LT5yZXNldF9waGFzZSkgew0KPiArCQkJY2FzZSBEUk1fS01TX1JFU0VUX05PTkU6DQo+
ICsJCQkJZHJtX2VycihkZXYsICJbQ1JUQzolZDolc10gZmxpcF9kb25lIHRpbWVkIG91dFxu
IiwNCj4gKwkJCQkJY3J0Yy0+YmFzZS5pZCwgY3J0Yy0+bmFtZSk7DQo+ICsJCQkJZGV2LT5y
ZXNldF9waGFzZSA9IERSTV9LTVNfUkVTRVRfRk9SQ0VfTU9ERVNFVDsNCj4gKwkJCQlkcm1f
a21zX2hlbHBlcl9ob3RwbHVnX2V2ZW50KGRldik7DQo+ICsJCQkJYnJlYWs7DQo+ICsJCQlj
YXNlIERSTV9LTVNfUkVTRVRfRk9SQ0VfTU9ERVNFVDoNCj4gKwkJCQlkcm1fZXJyKGRldiwg
IltDUlRDOiVkOiVzXSBmb3JjZSBmdWxsIG1vZGVzZXQgZmFpbGVkXG4iLA0KPiArCQkJCQlj
cnRjLT5iYXNlLmlkLCBjcnRjLT5uYW1lKTsNCj4gKwkJCQlkZXYtPnJlc2V0X3BoYXNlID0g
RFJNX0tNU19SRVNFVF9WRU5ET1I7DQo+ICsJCQkJcmV0ID0gLUVUSU1FRE9VVDsNCj4gKwkJ
CQlicmVhazsNCj4gKwkJCWNhc2UgRFJNX0tNU19SRVNFVF9WRU5ET1I6DQo+ICsJCQkJZHJt
X2VycihkZXYsICJbQ1JUQzolZDolc10gS01TIHJlY292ZXJ5IGZhaWxlZCFcbiIsDQo+ICsJ
CQkJCWNydGMtPmJhc2UuaWQsIGNydGMtPm5hbWUpOw0KPiArCQkJCWRldi0+cmVzZXRfcGhh
c2UgPSBEUk1fS01TX1JFU0VUX0dJVkVfVVA7DQo+ICsJCQkJYnJlYWs7DQo+ICsJCQlkZWZh
dWx0Og0KPiArCQkJCWJyZWFrOw0KPiArCQkJfQ0KPiArDQo+ICsJCQlnb3RvIGV4aXQ7DQo+
ICsJCX0NCj4gKwl9DQo+ICsNCj4gKwlpZiAoZGV2LT5yZXNldF9waGFzZSkgew0KPiArCQlk
cm1faW5mbyhkZXYsICJLTVMgcmVjb3Zlcnkgc3VjY2VlZGVkIVxuIik7DQo+ICsJCWRldi0+
cmVzZXRfcGhhc2UgPSBEUk1fS01TX1JFU0VUX05PTkU7DQo+ICAgCX0NCj4gICANCj4gK2V4
aXQ6DQo+ICAgCWlmIChzdGF0ZS0+ZmFrZV9jb21taXQpDQo+ICAgCQljb21wbGV0ZV9hbGwo
JnN0YXRlLT5mYWtlX2NvbW1pdC0+ZmxpcF9kb25lKTsNCj4gKw0KPiArCXJldHVybiByZXQ7
DQo+ICAgfQ0KPiAgIEVYUE9SVF9TWU1CT0woZHJtX2F0b21pY19oZWxwZXJfd2FpdF9mb3Jf
ZmxpcF9kb25lKTsNCj4gICANCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9hdG9t
aWNfaGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1fYXRvbWljX2hlbHBlci5oDQo+IGluZGV4
IDUzMzgyZmU5MzUzNy4uMjk4YzhkZmYzOTkzIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2Ry
bS9kcm1fYXRvbWljX2hlbHBlci5oDQo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9hdG9taWNf
aGVscGVyLmgNCj4gQEAgLTc5LDggKzc5LDggQEAgaW50IGRybV9hdG9taWNfaGVscGVyX3dh
aXRfZm9yX2ZlbmNlcyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0KPiAgIHZvaWQgZHJtX2F0
b21pY19oZWxwZXJfd2FpdF9mb3JfdmJsYW5rcyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0K
PiAgIAkJCQkJc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKm9sZF9zdGF0ZSk7DQo+ICAgDQo+
IC12b2lkIGRybV9hdG9taWNfaGVscGVyX3dhaXRfZm9yX2ZsaXBfZG9uZShzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LA0KPiAtCQkJCQkgIHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpvbGRf
c3RhdGUpOw0KPiAraW50IGRybV9hdG9taWNfaGVscGVyX3dhaXRfZm9yX2ZsaXBfZG9uZShz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0KPiArCQkJCQkgc3RydWN0IGRybV9hdG9taWNfc3Rh
dGUgKm9sZF9zdGF0ZSk7DQo+ICAgDQo+ICAgdm9pZA0KPiAgIGRybV9hdG9taWNfaGVscGVy
X3VwZGF0ZV9sZWdhY3lfbW9kZXNldF9zdGF0ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0K
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2RldmljZS5oIGIvaW5jbHVkZS9kcm0v
ZHJtX2RldmljZS5oDQo+IGluZGV4IGJjNzhmYjc3Y2MyNy4uMTI0NGQ3NTI3ZTdiIDEwMDY0
NA0KPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fZGV2aWNlLmgNCj4gKysrIGIvaW5jbHVkZS9k
cm0vZHJtX2RldmljZS5oDQo+IEBAIC02Niw2ICs2NiwyMyBAQCBlbnVtIHN3aXRjaF9wb3dl
cl9zdGF0ZSB7DQo+ICAgCURSTV9TV0lUQ0hfUE9XRVJfRFlOQU1JQ19PRkYgPSAzLA0KPiAg
IH07DQo+ICAgDQo+ICsvKioNCj4gKyAqIGVudW0gZHJtX2ttc19yZXNldF9waGFzZSAtIHJl
c2V0IHBoYXNlIG9mIGRybSBkZXZpY2UNCj4gKyAqLw0KPiArZW51bSBkcm1fa21zX3Jlc2V0
X3BoYXNlIHsNCj4gKwkvKiogQERSTV9LTVNfUkVTRVRfTk9ORTogTm90IGN1cnJlbnRseSBh
dHRlbXB0aW5nIHJlY292ZXJ5ICovDQo+ICsJRFJNX0tNU19SRVNFVF9OT05FLA0KPiArDQo+
ICsJLyoqIEBEUk1fS01TX1JFU0VUX0ZPUkNFX01PREVTRVQ6IEZvcmNlIGEgZnVsbCBtb2Rl
c2V0ICovDQo+ICsJRFJNX0tNU19SRVNFVF9GT1JDRV9NT0RFU0VULA0KPiArDQo+ICsJLyoq
IEBEUk1fS01TX1JFU0VUX1ZFTkRPUjogQXR0ZW1wdCBhIHZlbmRvciByZXNldCAqLw0KPiAr
CURSTV9LTVNfUkVTRVRfVkVORE9SLA0KPiArDQo+ICsJLyoqIEBEUk1fS01TX1JFU0VUX0dJ
VkVfVVA6IEFsbCByZWNvdmVyeSBtZXRob2RzIGZhaWxlZCAqLw0KPiArCURSTV9LTVNfUkVT
RVRfR0lWRV9VUCwNCj4gK307DQo+ICsNCj4gICAvKioNCj4gICAgKiBzdHJ1Y3QgZHJtX2Rl
dmljZSAtIERSTSBkZXZpY2Ugc3RydWN0dXJlDQo+ICAgICoNCj4gQEAgLTM3NSw2ICszOTIs
MTMgQEAgc3RydWN0IGRybV9kZXZpY2Ugew0KPiAgIAkgKiBSb290IGRpcmVjdG9yeSBmb3Ig
ZGVidWdmcyBmaWxlcy4NCj4gICAJICovDQo+ICAgCXN0cnVjdCBkZW50cnkgKmRlYnVnZnNf
cm9vdDsNCj4gKw0KPiArCS8qKg0KPiArCSAqIEByZXNldF9waGFzZToNCj4gKwkgKg0KPiAr
CSAqIFJlc2V0IHBoYXNlIHRoYXQgdGhlIGRldmljZSBpcyBpbi4NCj4gKwkgKi8NCj4gKwll
bnVtIGRybV9rbXNfcmVzZXRfcGhhc2UgcmVzZXRfcGhhc2U7DQo+ICAgfTsNCj4gICANCj4g
ICB2b2lkIGRybV9kZXZfc2V0X2RtYV9kZXYoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3Ry
dWN0IGRldmljZSAqZG1hX2Rldik7DQoNCg==
--------------T0xYU47CjgxbjfI3G4uk8Kjj
Content-Type: application/pgp-keys; name="OpenPGP_0xE3520CC91929C8E7.asc"
Content-Disposition: attachment; filename="OpenPGP_0xE3520CC91929C8E7.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBGK0ObIBEADaNUAWkFrOUODvbPHJ1LsLhn/7yDzaCNWwniDqa4ip1dpBFFaz
LV3FGBjT+9pz25rHIFfsQcNOwJdJqREk9g4LgVfiy0H5hLMg9weF4EwtcbgHbv/q
4Ww/W87mQ12nMCvYLKOVd/NsMQ3Z7QTO0mhG8VQ1Ntqn6jKQA4o9ERu3F+PFVDJx
0HJ92zTBMzMtYsL7k+8ENOF3Iq1kmkRqf8FOvMObwwXLrEA/vsQ4bwojSKQIud6/
SJv0w2YmqZDIAvDXxK2v22hzJqXaljmOBF5fz070O6eoTMhIAJy9ByBipiu3tWLX
Vtoj6QmFIoblnv0Ou6fJY2YN8Kr21vT1MXxdma1el5WW/qxqrKCSrFzVdtAc7y6Q
tykC6MwC/P36O876vXfWUxrhHHRlnOxnuM6hz87g1kxu9qdromSrsD0gEmGcUjV7
xsNxut1iV+pZDIpveJdd5KJX5QMk3YzQ7ZTyiFD61byJcCZWtpN8pqwB+X85sxcr
4V76EX85lmuQiwrIcwbvw5YRX1mRj3YZ4tVYCEaT5x+go6+06Zon3PoAjMfS1uo/
2MxDuvVmdUkTzPvRWERKRATxay28efrE5uNQSaSNBfLKGvvPTlIoeYpRxLk7BN0x
i/KZIRpSlIf0REc1eg+leq2Hxv7Xk/xGwSi5gGxLa6SzwXV8RRqKnw2u6QARAQAB
zSFTaGVuZ3l1IFF1IDx3aWFnbjIzM0BvdXRsb29rLmNvbT7CwY4EEwEKADgWIQSX
5PUVXUNSaGVT2H/jUgzJGSnI5wUCYrQ5sgIbAwULCQgHAgYVCgkICwIEFgIDAQIe
AQIXgAAKCRDjUgzJGSnI57GwD/9O6kei9M3nbb1PsFlDE1J9H27mlnRWzVJ2S3yJ
8G1oJo8NSaRO7vcTsYPBYpEL1poDQC5MEGh6FXSiOnyyHrg8StmGLksQE9awuTnl
nQgvXDQMVtm87r1abBAavP5ru2R9x/Tk63+W/VT2hPekMfHaJwFi1KATSI1AhsF3
CVoj0yDulz1u0uZlircKdbeEDj+raMO0LA12YxWaWtL/b9XaoAqV9voraKhx+0Ds
ZS5bWoUvs+715BArPBr4hPqKavsBwOWfzWDTKln2qv8d+glWkmk6dgvZFcV/9JEJ
Q8B7rOUMX614dqgwi1t71TI0Fbaou3nhAnES1i1it/aomDUCLvRwjGU2oarmUISF
gvZoGYdB9DfVfY3FWKtfDJ9KLUk9k3BFfBZgeAYoLnFZwa3rMyruCojAGTApZtaa
LZH/jzQf7FpIGGhDYnvGKXS01nLCHuZSOEvURLnWdgYeOtwKW1IIcnWJtB12Ajz2
yVu3w4tIchRT3wekMh2c3A3ZDeEjszezhFyXgoRpNYDBzNl6vbqhnopixq5Wh/yA
j6Ey0YrIUbW9NOhIVCGkP4GyJg756SGzyPny0U4lA+EP7PS3O7tE0I3Q5qzDH1AE
H2proNlsvjZeG4OZ9XWerI5EoIxrwZcOP9GgprB4TrXUR0ScTy1wTKV1Hn+w3VAv
6QKtFM7BTQRitDnpARAAsPFINiaOAxfatzRTme/1cG+kpSqY9znQYxkz8EWY1eAO
Qs2xKl65JUyhTRPQkW8cqDVzdVF16wW+1RyoMrtK5xj6jm9K7VAAc/sDL2LkoSjj
3FpoOp/RMfVBiLGATCdNSEDFPO6nGVJn8aOXmH54sgZzhgfqW1X9Y4ToWViF5VXZ
sWGzHPsXoVvlRyPfAYi9eL11hZqQVhXPOQTuAG4ow8z7ZGYT7wfZo9oXvs/11DQ/
pxt7aO8QGCNCsWnMOecPBy9+Tbr/huxLVFl+boaTv3QwdATHFtObOi+q3m6RAADB
VQSiACVCsqb02HADfhO8n0AM75fJjbXFTLBR06+eME0h0dF8d9hu9gHe3ZHqsvB4
X5E9UP+Vf8c1M9aoJrULVoAOo50gmCEhjlzI5xYczBtw1bhOXCP0Wj5cmx3wbKq7
UKMXjDKF9ag907d078BaIzhMOChN6s9c03KM6ix0nLpBGzYZXC0VL+yqKkiHJzee
mBJ4YzLvf8rCGxbg8kKPQ2ongQVpcE4rr6uS/kCoB7BpVSaHraAHA6IwpGccOlU+
0v9rBghE1QzIlhkzcxwzxlb7rTZsedxSPQLVdPaRG9rkz3Qw3mWYYs2w7dJahgIm
p1z/v9qdTWYdHzKRyafluFlz0PoUcVuGz6PwFzDxGV5Gqqg6zHLEx68KxKwoyecA
EQEAAcLDrAQYAQoAIBYhBJfk9RVdQ1JoZVPYf+NSDMkZKcjnBQJitDnpAhsCAkAJ
EONSDMkZKcjnwXQgBBkBCgAdFiEET/yoGP3p5Zl+RKVuX75KBAfJsRkFAmK0OekA
CgkQX75KBAfJsRlTUBAAjQoMom0dfgWNNIXpvQgiGRh6slnyZ/QH4j2CGNTgfNC1
CV4SVC7U/A3lFDoDGbcsISb7uKyLnjrn1c3rguT9JXzuIbQZotgE0LvG09odGMXD
S92CmBaKnvhYlSO0cUdRtgvnw3nMgl1Kz7a8vvjYl3S1XhXQ8bpgrh2Sn36oqhaS
//Mgy52qHN2lRz09lr9Ig1NSXkjguSyj1hTc5wOWV+rsX4is0nOBNaov76/tbcF6
sIsHyHPSGzZ4jefZs318ineuBnrtVE9sH9XWc1QHLF1gzOKKwssddXlYe2Sj5plX
vZqcHHYfrOLe+v1gxW21HumUosTsCDUVJ9egr1DQcaQiiOUV5qQi4/GfqFAacken
NbHcNLpOxaOE3IwbL0F7aZHsKsl18suDXAqb3ljyAm4fEZr2ceEnE7n1x9BZizJL
YbkYB/k6gxxxbyjcoR6F1niEE+6Hs9vKGNmvNQikPpv05IDXgOr6pgWWCdZCiup3
N72xS3OCZNkkVQjaSL6/hN/IcR8+Xtp+nbYH4Agm9hBAPN045l/P9nVmSQOJ3TC+
wGgo8N16qzW061YD/faB/g/u7RcSfi5SwISIyrNXnyhBZTrFx+0KsjtdwVGJXYRS
/tio6zRaBl/bO3+e8SGqsHU3f6JH+HgTWJINfj3I/wDIBAL0XGoDAE8tqQBpsTBd
mA//WestyKDwfpZEqz9wBNX4QUS/zh+1GiweKcgqXhi4RuV/MXTPXcET1/pGnX5S
h9hdBj6lIseTtbSVDBHQm/1qUPYFAG+grdWZ7YrPIXfKTUCBlE/pKcJ6Yi1RIW3o
OQ1+OfYaPDfqOnq2Ed+HFM+KNFhWtU1TRUBikU1n88lMcRlFHFtkAuZgsDwj2b+v
c71uXNA3YkcFHGBhq7rJQu3B1l2zvM0P0ds0HAo58iJ4qqMkA07EJStaATOokDAC
4Xo+n7DHu81pQPP9BTY9u1G+m4mlpivWqIVk5Gbb+2w9yCmkEWqv5QYPtjpgxq0h
zURLeU+BDvOUKjCS5480NvxWwOthPqYls0WgoSVVMtDpeklSRxmrHJ6k+H1gV9Ja
WcfQO/l0IQrQm1+xE8xz87oHl18gIVbpXmlfss6EnPfmhdst/FqxXM0sxV+QD3oF
mf/CcRG4SSqjsKkpQviDMG5TwN52mWwoirk2MYlNGLNwknWXhRb0l7r4SyZNfOWp
0EI0EvO+CfKZL03drnmMaeOoXXtKwmWgCpYTa6dxtTTVKbeUKYy2p+jYZqUONl3y
CwuL9UIOwE+LxhtED4ZjIWxoD5/uOBGLofP/eNZpMmmC9H18rupdh6ChGYi3q6/L
6oHNPDbwJUFv9UJys+MwOV1Lzq8ULCxRfYntnhug1iZHYdTOwU0EYrQ6CAEQALWU
YW4bgH3p7jUtpD8rUoaHTJ+G3z9ZUjYvz+r0llcpurPm0DyG7kWHzbzGTCkdYTxf
dxEaUggMfWxLC7Vyd8PadoBTlJJ++7MP9eL9IzyaJEG034N3TtDym/v/PataFbjs
hi4YF1tT/2RnSK3neeotr7FX8+zZrz5EgE69Wz06HGIKanRn9fhUKfKQzetGl0NE
Se62aTkxsf+Qb4Hq2i1wm6ct4m2iRfdhw1OUDNQHgbOy6V8mxXPg2fsJLVC3inpg
BdhA5xWrkAnxouujB1xs9g4Mu+5WnUqc/jr6S0zKbm81Xohl8JDbGvxbOpb9fmq2
NnVLR4771NJC3/2qzU/pjgjA/HNmjmqYFEIToTNlNjsEYGydcujlSsjdFDe+pA6S
kqUrEHpaVf031JOCzEzgfqyH3gMBtDXyrGAs8Vdnb1/ROMIALqbK8nh2IYnRblME
J3D6nJDlYMVwsDgOhhrTFREBUdLJ7lZ+LpS4ACctKyV22Eo/L2nOFeu1+pdgivMb
4L2VIJtgvzKFfV3I6MUMzSDMkhQzQZjPq7Uzlu0cZ9ZpSO7HuUzigJZ6vnE7iwLv
i/yyjUUqHnSmLFFE4xxpnsMlDZXBxx0HIzEt48M2dmvfmD+SqSiQrE/3qgWaIjwC
+lfYggYjPtNgSntkfOsCvDqnob8b0dpqRcFT5Px/ABEBAAHCwXYEGAEKACAWIQSX
5PUVXUNSaGVT2H/jUgzJGSnI5wUCYrQ6CAIbIAAKCRDjUgzJGSnI5/3nEACdQ2vO
zmUJ2LoFq7z0Dn7HVfUX8slzja7LBl3vCw/2Oq5s2VbvgZuPRfUxdEMXPlTqyab/
VVbHzqhSYtMMpDsMhEnVZ4DawFvWVs3yL5BA0qU5Wsb82zRGO6Qab29cRaEjK6Lt
a6N9vfVyn7ZQNvUWB4sB9RyAtSTyQVrEuLZWoWfQLRqOaecFaBCsTeg/0q4ywnBY
kCZR9ciEnLGVRZt6oE7qNoNLsyTNKNWNge0/Jiv67Jt4VByZWwqz5f65GBAJYUlC
qWsCoZXUYTnqlFAnI533ZhYEx/x7UzCJREAPgpP0/DOfmaf54QqTwsdKU7g3VE0a
N7Vhy/ja4sCvgLmTUftKXr7k2Dsg+gldB54P95VPOot4DdehlcTVkI1HUNabPSJ2
kIS8bIHr0JrIMzqqOhlIh0CHcbwLXBu6V7+x0YcbGQPuvIfJYsYjHhNVt9Dx9Z8Z
+YDfxJJXY3ORfcQbtf700l/XRs3q9c2WRZ+CfJWw+kfpHjmq6BfEPUtXGJ0G4d7w
ErIZszYIviEpi7UdWuM48WNgJSjb/o5HaSLY6LeXXsMVXlOceYtbF1idw7eMTchU
rNj2bNSLj0qJZstNIVWXRYhpq/ELjJjqOmGoEnVb668sPNdpObwLJA+QDAvRBq7t
WPHvRXXbC5TEqFVd89bPHQNQyvecpEnSBbVWU87BTQRitDmyARAA0QGaP4NYsHik
M9yct02Z/LTMS23Fj4LK2mKTBoEwtC2qH3HywXpZ8Ii2RG2tIApKrQFs8yGI4pKq
XYq+bE1Kf1+U8IxnG8mqUgI8aiQQUKyZdG0wQqT1w14aawu7Wr4ZlLsudNRcMnUl
mf0r5DucIvVi7z9sC2izaf/aLJrMotIpHz9zu+UJa8Gi3FbFewnpfrnlqF9KRGoQ
jq6FKcryGb1DbbC6K8OJyMBNMyhFp6qM/pM4L0tPVCa2KnLQf5Q19eZ3JLMprIbq
KLpkh2z0VhDU/jNheC5CbOQuOuwAlYwhagPSYDV3cVAa4Ltw1MkTxVtyyanAxi+z
a6yKSKTSGGzdCCxiPsvR9if8a7tKhVykk4q2DDi0dSC6luYDXD2+hIofYGk6jvTL
qVDd6ioFGBE0CgrAZEoT0mK6JXF3lHjnzuyWyCfuu7fzg6oDTgx3jhMQJ2P45zwJ
7WyIjw1vZ3JeAb+5+D+N+vPblNrF4zRQzRoxpXRdbGbzsBd5BDJ+wyUVG+K5JNJ3
4AZIfFoDIbtRm3xt2tFrl1TxsqkDbACEWeI9H36VhkI3Cm/hbfp2w2zMK3vQGrhN
uHybIS/8tJzdP3CizcOmgc61pDi/B6O2IXpkQpgz+Cv/ZiecDm1terRLkAeX84u8
VcI4wdCkN/Od8ZMJOZ2Ff+DBbUslCmkAEQEAAcLBdgQYAQoAIBYhBJfk9RVdQ1Jo
ZVPYf+NSDMkZKcjnBQJitDmyAhsMAAoJEONSDMkZKcjnnIcP/1Px3fsgNqOEwVNH
7hm0S2+x/N/t3kz50zpKhczHZ8GWbN3PPt4wkQkdbF+c7V4uXToN4a17bxGdUnA9
qljxt8l3aEqd4jBqLn2OJriu21FSnrZOpxb1EwWwvnVUwrLxCuV0CFQJdBlYp2ds
64aV8PcBOhQ62y1OAvYpAX1cx5UMcHsNVeqrWU0mDAOgvqB86JFduq+GmvbJwmh3
dA8GnI2xquWaHIdkk06T55xjfFdabwEyuRmtKtqxTP/u6BzowkV2A/GLxWf1inH5
M81QgGRI2sao6To7sUt45FS+y2zhwh62excOcSxcYqKzs/OiYEJjWMv9vYRwaqJG
EVhbfGFOjeBOYr+ZCCeARh+z4ilo1C2wupQT8VPsFiY9DRYgkAPKlbn9OqJvoD7V
hvyelJagSNuRayrrmnEaZMsoRdS22fneCVWM0xlGSgPCVD0n9+6unTnVbmF/BZsE
g5QufQKqlFSomu1i23lRDPK/1aPc2IoxcQPh2fomy8spA5ROzOjLpgqL8ksEtQ75
cBoF1K5mcC2Xo1GyDmdQvbIZe+8qwvQ3z9EDivvFtEByuZEeC5ixn4n/c9UKwlk+
lQeQeN+Bk7l8G9phd4dWxnmWXQ/ONR/aLzG+FguuGNZCPpu5dVQH44AXoFjoi9YV
scUnWnv8sErY943hM8MUsMQ5D0P2
=3DUrys
-----END PGP PUBLIC KEY BLOCK-----

--------------T0xYU47CjgxbjfI3G4uk8Kjj--

--------------GuFw0J0B80x7J0Fp9uEV2uaQ--

--------------5E30Ek5fH1DMV3arFO6mnuNn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEET/yoGP3p5Zl+RKVuX75KBAfJsRkFAmmjOGUFAwAAAAAACgkQX75KBAfJsRkp
XRAArAr2GMDGyR3n0CFb7jR3iwbtbYepde1xPfhzwgT12EpP96feToJyZRfTQ6s2mdxAArIv1TlH
0vmVflUoEYq/uEweRhqpGSeWbL7CvW2WXZeQfE4IJk9yuFUYnEHC0xFgcm24tK44IB84gRdhP1Tr
qCYFTYVPUn/kmIVRclPxhSskTRGqoxzjKWwm485ocq5pW2iKXgtjMqU9yM1ks7ROXfQdBx0J8/q0
qDjHlEwzakbxiJveUCYlIIzF8QknIW1ZuKqFIizTnJj145/OlzxkhJJfXqUsSeCCuUo7yoEwUsWP
qzgBwoN23tjXlE0XdLwmfJV5e4+QMz6miCG9cf1Ak3AF5rVhklMcgDJ39bVKPgb3Gh0v2hPGxwwC
TXcLxzH6aykKI6S8iNNHVlsDhtB8Vu26l76skMAGT43fMH+yXW754fGHrrV+3NMq0O+nfO3DsnvG
qPRg7Ov+keTSNxG0Y93M+K0Mpn6yelSLR3Vd9AqsGAhW6xVqPaE55wQaLngvNX+ofHLGhBBa8/Qr
s0VEsF2mGrdrMqIwgF88aLiZxyv2RtMWlDJxuteZRLA9p1zdljvTIFnWgwBOccsp9AiQ+s+lGU0+
oBYZQ85yucm97HF/B+rKhbQSgYds+qBCLYz62zCv/quhnFdmOuNLEsAhvVi1mrCklqUeyceDuJCE
Z/A=
=z5dS
-----END PGP SIGNATURE-----

--------------5E30Ek5fH1DMV3arFO6mnuNn--
