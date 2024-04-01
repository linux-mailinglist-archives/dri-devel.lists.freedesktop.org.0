Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE566893C48
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 16:38:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D6710F1D7;
	Mon,  1 Apr 2024 14:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qT9qQtdy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2093.outbound.protection.outlook.com [40.107.92.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D870B10F1D7;
 Mon,  1 Apr 2024 14:38:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FHUyQSGxT9SMVmihgzFAOzP+s0yYq/GVHsoxhtcmU9hcwyj4j8/w58zNthEzLBAZvJOxxjPr+1BG+d9czkMVN3C4bGS7F1WksWhJ9u+mAnikXA33DGr57IzQpVsmbwKbsdOncQj6OLzRKKtoPOyij6/dSySqozjjbWDk5hOQLppwyGVXxDqT2ebIZ/imw61MMkn38WV8Qe7lcy73zt9ULv8GPfq23ww03MHBIVNt5vFQb2Aa7NG0XpFVaeySX61HfRrovENJ3xi4HvG4E7D82vKd0LYfReVx+TvP3Nw6LWkncTZ4wPHDYLQ6cHLu4I2NyT98ND7aVY4y90ZyGd3kHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oy5/5ToR8kyk5eOCNKmamyBORSgYBa7SgZPfs7yEmLs=;
 b=PJAomY3dLnWApwMb1wX87N4GWI8VgyNohsFbMYEGS9zukPaIi9LJMQFUEQBIZz2FufohfMiVgTSo16ia9DSMSh6LNvAtJRjNeHApkI+fGqZIQ8V1tHo+6W3X1bUmsJDmgUrap4TjzjWMdIylnLuagZ5gOiIO+KdEzAZtTjT1/utnV7ivrWLBUTTSRTIWkD81iqcaPSM7M845GuuN7jW7F0VQVA7uWM0L548yj6Y2W+hM/mIcVlg4JoYOR1wR2p5clW302YvtXkyPCW5kxkUUgieJYFPFMqVdqd3yCar5ij5JNSSIGsHhTQx7hx11zyjrGh9rariB31EANUH/a3zDSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oy5/5ToR8kyk5eOCNKmamyBORSgYBa7SgZPfs7yEmLs=;
 b=qT9qQtdy/u+QXSZW1I8K7Wm+8VDUCeJA3YgOiaV5/qrXR22WTMyRBogOP9rqj9T+agihaOAseElf6cONIRC5E3Y1w97dMA/CDCVL/e43OeJJzMVFI6Dkt9WSx4SiDjIJiqNdJJZq0jyrJE+2KcnzBN8Yhua+S3nySsS0rRMS8XM=
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 DM4PR12MB6349.namprd12.prod.outlook.com (2603:10b6:8:a4::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.33; Mon, 1 Apr 2024 14:38:46 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::f86e:7f84:27b2:f80]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::f86e:7f84:27b2:f80%7]) with mapi id 15.20.7409.042; Mon, 1 Apr 2024
 14:38:46 +0000
Message-ID: <394f8102-a633-46e6-8727-1b3f68781b80@amd.com>
Date: Mon, 1 Apr 2024 10:38:41 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/amd/display: Introduce overlay cursor mode
To: Harry Wentland <harry.wentland@amd.com>,
 Robert Mader <robert.mader@posteo.de>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Joshua Ashton <joshua@froggi.es>, =?UTF-8?Q?Michel_D=C3=A4nzer?=
 <mdaenzer@redhat.com>, Chao Guo <chao.guo@nxp.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, Vikas Korjani <Vikas.Korjani@amd.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, Sean Paul <sean@poorly.run>,
 Simon Ser <contact@emersion.fr>, Shashank Sharma <shashank.sharma@amd.com>,
 Sebastian Wick <sebastian.wick@redhat.com>
References: <20240315170959.165505-1-sunpeng.li@amd.com>
 <20240315170959.165505-2-sunpeng.li@amd.com>
 <a7ea3f24-6e21-4a7d-8f53-42a12a8d8be8@posteo.de>
 <44b81511-ac1c-4104-812b-9cdc04e6bc83@amd.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <44b81511-ac1c-4104-812b-9cdc04e6bc83@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0044.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fe::19) To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5311:EE_|DM4PR12MB6349:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /Ivn6ch/j7OB3KlLq5/I+MCa+yMhIbJKAW07YtyMVabYhRDsQo7nW7QkJzIwJ8g8UX10qac4+zdYBaVSEfY6IQmKY/Tc/37tm5faSFNMumoVagofjSpcHpOcZzHI2Ne/3FIqP19zWKLdgWodUW80FgZ9fgJ36z6b4a/cY36/4paQyHpzB2ESHjF1NAK46UDjs0muFo0jca4oWi0YC7BVbxZbrcStBA+1A5ZDpCBa88FRdM7CtnOQRkw4yL78I2IQ6L8OEC3N32DV4ymNi47PoUpJstI5tx1JefkRn6qq/6CmWGM7we1PJj/WnwIiDkJ/mlXmitjOmikxFwpQ4NnGYmhEylQRdx3nvwkCDrBXuU3v8FN4jjBH2wLeA/9DgXy6gGoi1BJHbFJrvwClFCRa44WCrRg0Oy8UJeQIn+OY54hd6xBStl+4siaiPNJqlgInFMxFt1SnsolukdpWVf7ls1TTrqv2t9UiHng+aAq5aNVqD6Z61G2ul290CvDUOTyvSX5g8syt+2IKw8n9i85EeBiqYYXvlwEvRgnYJFyY4QiCiHszyav+8dOnOIWJ6fPH+kONd2FqFIoCpwI5nCNFb44zwLSUbHYgNayi3eXjhjA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dC9GN2gvbithdDV1a2xVR2tMQzhJcmJxcHZxWEVlOUxKditwOWFYYk1zcmNx?=
 =?utf-8?B?S3hoakRvTHRhazduQ2hwN1NQK3RoRm45KzlyNHpTSmlPWGd5ZVRiUU9za0Jy?=
 =?utf-8?B?NGNmK2xYSzNjRVo1NkxHQUxNYVhPNUxJdXRHc2hpSTg5NjZzUys2OTlaWkNL?=
 =?utf-8?B?MjRCSUhCaU9qbmlpUzgyMXZpUzNyMzhiLzJ6Vis0UGhCbkpsMEVLeEV5WHQz?=
 =?utf-8?B?WVl4VUd2dEpOWkYwRi9MMHVJSWZubGtENzY1aTNlYUNaRDMwdHhXRFlmRFdh?=
 =?utf-8?B?eFFpZ2JVOU40TGltTXVNTWozYkhndHVUZGhyRk0rTmRpZ2psY2w1NWpBaFNm?=
 =?utf-8?B?V1RGS2p1c0FySVdGdVVjaENkeVV2TTk4cTdnamhMaWpOeUlDTjJlWjRTUzBI?=
 =?utf-8?B?S21IaDhBSWllWllrOHlVdnRudUJWUmxwQkVnUXVGQkJwcjZ0clh6cExLVWIr?=
 =?utf-8?B?d2pSeWs4QVFLdkVidGhBM2RwVW8zMnIzaHRrOHZwYkxGRzZ3S1E0QWdZVUdM?=
 =?utf-8?B?RDluMzRNbXNacVZuM2xZNmpPZm9KSmtZZUVnM0doNll5K3JRbzZpamRvc1JR?=
 =?utf-8?B?TEI0U1JBbFZoMklpQ2hqQlAzSHlTWTMrUVdGMUlyby9yUlBYSGdGL0htdmoz?=
 =?utf-8?B?bkhYZ1RlMGdDN0FOT0ZiYlloQ1JXc2c3Q3ZlVytmTmdQclg4Nitaa2oxb1Nm?=
 =?utf-8?B?K29jb1o0Z0JXYW81QnpVNEc4cXN2VEZTMUlnU2xrZUVvZ1RJRVJROFhNUkpO?=
 =?utf-8?B?V003U3BLQ3poaDNHRkQzejJpaHJaeHNNMkxudHA4OFdDdHE1emJnT1VDQ3hk?=
 =?utf-8?B?RUVjY0JRUEc4MU1RWXZBdnZKejNLU054U1A0S2ljSnYrMWdkREF6d0orTG5T?=
 =?utf-8?B?QkRmbzN3clFDSTJJajd6alNkT1RrVUJPR3U1dHNBdDVZajVlaDIyVTZEZkVE?=
 =?utf-8?B?R0FVUUNDeGtGaUpNRUF4SnFVYWNuZi9jVTRHWUl5blVrMjJXM0VITXVJTEZX?=
 =?utf-8?B?VDhVMGZYY2p6NzZVY2dDUG05NUxFN2wvZWFQNDNuNTBWeHFaaC9WZWdJQ3Y2?=
 =?utf-8?B?MXQ5ZUlwVHZNZytpT1hxekNtZVRpWVVmYU5UaDBGN0RuTkw1cW5Fb250ZjRx?=
 =?utf-8?B?VjFJZm93TkZzdjRoTmNnU1k3UkthOXROazYvMU02TTI0aHlwZFVJVjlsd3FM?=
 =?utf-8?B?MFpOTU15V01COURwUHYzSVFEcGtxNWJDZ0xNbmlBWmhCQkQ1L1FHSitUL1d4?=
 =?utf-8?B?S0JzWUZZMTVyaVYzSHNLaHFySHlmT2MzbkRHejdvSVdKalVGdUNIcXhic2xv?=
 =?utf-8?B?cnVFZ0xrc2xoeVhIWndjVGpMVmtFS3VhR1BSWEV3U21LTllXelA5bVBqaDNO?=
 =?utf-8?B?WEEwdUJkS0N5cENiN2tIWU5MTStlK1pNa3RZamNuQU1lMmVnanVpYk5vdkYy?=
 =?utf-8?B?RXJNT3Q5RFlLVklDeUEzeDVhVDAxYWZvRFBDd3BlNjU1RzJRaTUyZjNvOHg1?=
 =?utf-8?B?ZHRDL1RubFJVTHJiOUtnaFl3RnE0UVhPaTlvU3VkU1BZdVlPQ0JlTHEwaDlJ?=
 =?utf-8?B?ZUxHdzZEaVdKeG5Bck05NkZDb2FBN0YvZjh1N1llZWhhVnpEYldUd1ZabTZB?=
 =?utf-8?B?aUhpTThnYWxReXNaZjZmZFgrbi9uYzI1cXhLcCtTNzdkOUlCZGU1bTE3Snha?=
 =?utf-8?B?YTFxNlZMaUJ3c2dyaXZWSWdibWlJYXVaUGRQcmdxTDhRL2tLblpmMk4zZnhq?=
 =?utf-8?B?bTdnUEFjMmdHWGhWbnpnVXZQM2pOOThpcFRxd2JqMmZVK1hjY1poZGxXNWhX?=
 =?utf-8?B?MnJrMVRMQ1VBcmF1S3gvL0UzTXN5QlZVejBPMjU4dTFwWXZIRlE2VmR1T21V?=
 =?utf-8?B?aXYrWXZ5MlhoZlFJa0R5Wlhsbk1wbXlkaWZVQnBSNzdLQUZ2NDl0QWlUY29n?=
 =?utf-8?B?SUgzNjE3TUd4ZkE2THpHZE5mQUoyVzRTbmNSY3A3cHVYZCtidE1pZm5EMDI4?=
 =?utf-8?B?a1J1U1VQMmRJc0h5b3BYajVTT2FuUlV0azZSL1NIbmNEZHl0WFZoQmtPOU1H?=
 =?utf-8?B?QlJOWDYvN0loeGRwbVFRNnBTWEVDR0dCV0JWcVBRUmM0WVRYMDBWWEw3WjBt?=
 =?utf-8?Q?9QIzzH5tCBAqMCDPRVNZBNZhd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b171c295-c252-4bfd-6513-08dc52596fd7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 14:38:46.3349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GV6FdKzzIvERNo9iWXTnqHfc6sk5F5mz7+8D76J5QL2nPD6ugEDFDBE40fTGvV5q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6349
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



On 2024-03-28 11:52, Harry Wentland wrote:
> 
> 
> On 2024-03-28 11:48, Robert Mader wrote:
>> Hi,
>>
>> On 15.03.24 18:09, sunpeng.li@amd.com wrote:
>>> From: Leo Li <sunpeng.li@amd.com>
>>>
>>> [Why]
>>>
>>> DCN is the display hardware for amdgpu. DRM planes are backed by DCN
>>> hardware pipes, which carry pixel data from one end (memory), to the
>>> other (output encoder).
>>>
>>> Each DCN pipe has the ability to blend in a cursor early on in the
>>> pipeline. In other words, there are no dedicated cursor planes in DCN,
>>> which makes cursor behavior somewhat unintuitive for compositors.
>>>
>>> For example, if the cursor is in RGB format, but the top-most DRM plane
>>> is in YUV format, DCN will not be able to blend them. Because of this,
>>> amdgpu_dm rejects all configurations where a cursor needs to be enabled
>>> on top of a YUV formatted plane.
>>>
>>>  From a compositor's perspective, when computing an allocation for
>>> hardware plane offloading, this cursor-on-yuv configuration result in an
>>> atomic test failure. Since the failure reason is not obvious at all,
>>> compositors will likely fall back to full rendering, which is not ideal.
>>>
>>> Instead, amdgpu_dm can try to accommodate the cursor-on-yuv
>>> configuration by opportunistically reserving a separate DCN pipe just
>>> for the cursor. We can refer to this as "overlay cursor mode". It is
>>> contrasted with "native cursor mode", where the native DCN per-pipe
>>> cursor is used.
>>>
>>> [How]
>>>
>>> On each crtc, compute whether the cursor plane should be enabled in
>>> overlay mode (which currently, is iff the immediate plane below has a
>>> YUV format). If it is, mark the CRTC as requesting overlay cursor mode.
>>
>> iff -> if
>>
>> IIRC another case where this would be needed is when the scale of the plane 
>> below doesn't match the cursor scale. This is especially common for videos and 
>> thus implicitly covered by the YUV check in most cases, but should probably be 
>> made explicit. Michel Dänzer might be able to comment here.
>>
>> Another possible case that could be covered here is when some area is not 
>> covered by any plane and just shows a black background. This happens e.g. if a 
>> compositor puts a YUV surface on the primary plane that has a different 
>> width/high ratio than the display. The compositor can add black bars by just 
>> leaving the area uncovered and thus require only a single hardware plane for 
>> video playback ("Unless explicitly specified (..), the active area of a CRTC 
>> will be black by default." 
>> https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#plane-abstraction). If 
>> the cursor is visible over this black bars, AMD currently refuses the commit 
>> IIUC (see also Michel Dänzers comment at 
>> https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3177#note_1924544)
>>
> 
> Thanks for mentioning both of these scenarios. I agree it would be
> good if we can expand the use of the overlay cursor to these cases.
> 
> Harry
> 
>> Thanks,
>>
>> Robert Mader

All good points, thanks for the feedback. I'll take a peek at the scaling + no
underlying plane case and send a v2 when I get around to it.

Leo

>>
>>>
>>> During DC validation, attempt to enable a separate DCN pipe for the
>>> cursor if it's in overlay mode. If that fails, or if no overlay mode is
>>> requested, then fallback to native mode.
>>>
>>> Signed-off-by: Leo Li <sunpeng.li@amd.com>
>>> ---
>>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 309 +++++++++++++++---
>>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   7 +
>>>   .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |   1 +
>>>   .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  13 +-
>>>   4 files changed, 288 insertions(+), 42 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c 
>>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> index 21a61454c878..09ab330aed17 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> @@ -8359,8 +8359,19 @@ static void amdgpu_dm_commit_planes(struct 
>>> drm_atomic_state *state,
>>>        * Disable the cursor first if we're disabling all the planes.
>>>        * It'll remain on the screen after the planes are re-enabled
>>>        * if we don't.
>>> +     *
>>> +     * If the cursor is transitioning from native to overlay mode, the
>>> +     * native cursor needs to be disabled first.
>>>        */
>>> -    if (acrtc_state->active_planes == 0)
>>> +    if (acrtc_state->cursor_mode == DM_CURSOR_OVERLAY_MODE &&
>>> +        dm_old_crtc_state->cursor_mode == DM_CURSOR_NATIVE_MODE) {
>>> +        struct dc_cursor_position cursor_position = {0};
>>> +        dc_stream_set_cursor_position(acrtc_state->stream,
>>> +                          &cursor_position);
>>> +    }
>>> +
>>> +    if (acrtc_state->active_planes == 0 &&
>>> +        dm_old_crtc_state->cursor_mode == DM_CURSOR_NATIVE_MODE)
>>>           amdgpu_dm_commit_cursors(state);
>>>       /* update planes when needed */
>>> @@ -8374,7 +8385,8 @@ static void amdgpu_dm_commit_planes(struct 
>>> drm_atomic_state *state,
>>>           struct dm_plane_state *dm_new_plane_state = 
>>> to_dm_plane_state(new_plane_state);
>>>           /* Cursor plane is handled after stream updates */
>>> -        if (plane->type == DRM_PLANE_TYPE_CURSOR) {
>>> +        if (plane->type == DRM_PLANE_TYPE_CURSOR &&
>>> +            acrtc_state->cursor_mode == DM_CURSOR_NATIVE_MODE) {
>>>               if ((fb && crtc == pcrtc) ||
>>>                   (old_plane_state->fb && old_plane_state->crtc == pcrtc))
>>>                   cursor_update = true;
>>> @@ -8727,7 +8739,8 @@ static void amdgpu_dm_commit_planes(struct 
>>> drm_atomic_state *state,
>>>        * This avoids redundant programming in the case where we're going
>>>        * to be disabling a single plane - those pipes are being disabled.
>>>        */
>>> -    if (acrtc_state->active_planes)
>>> +    if (acrtc_state->active_planes &&
>>> +        acrtc_state->cursor_mode == DM_CURSOR_NATIVE_MODE)
>>>           amdgpu_dm_commit_cursors(state);
>>>   cleanup:
>>> @@ -10039,7 +10052,8 @@ static bool should_reset_plane(struct 
>>> drm_atomic_state *state,
>>>   {
>>>       struct drm_plane *other;
>>>       struct drm_plane_state *old_other_state, *new_other_state;
>>> -    struct drm_crtc_state *new_crtc_state;
>>> +    struct drm_crtc_state *old_crtc_state, *new_crtc_state;
>>> +    struct dm_crtc_state *old_dm_crtc_state, *new_dm_crtc_state;
>>>       struct amdgpu_device *adev = drm_to_adev(plane->dev);
>>>       int i;
>>> @@ -10061,10 +10075,24 @@ static bool should_reset_plane(struct 
>>> drm_atomic_state *state,
>>>       new_crtc_state =
>>>           drm_atomic_get_new_crtc_state(state, new_plane_state->crtc);
>>> +    old_crtc_state =
>>> +        drm_atomic_get_old_crtc_state(state, old_plane_state->crtc);
>>>       if (!new_crtc_state)
>>>           return true;
>>> +    /*
>>> +     * A change in cursor mode means a new dc pipe needs to be acquired or
>>> +     * released from the state
>>> +     */
>>> +    old_dm_crtc_state = to_dm_crtc_state(old_crtc_state);
>>> +    new_dm_crtc_state = to_dm_crtc_state(new_crtc_state);
>>> +    if (plane->type == DRM_PLANE_TYPE_CURSOR &&
>>> +        old_dm_crtc_state != NULL &&
>>> +        old_dm_crtc_state->cursor_mode != new_dm_crtc_state->cursor_mode) {
>>> +        return true;
>>> +    }
>>> +
>>>       /* CRTC Degamma changes currently require us to recreate planes. */
>>>       if (new_crtc_state->color_mgmt_changed)
>>>           return true;
>>> @@ -10216,6 +10244,68 @@ static int dm_check_cursor_fb(struct amdgpu_crtc 
>>> *new_acrtc,
>>>       return 0;
>>>   }
>>> +/*
>>> + * Helper function for checking the cursor in native mode
>>> + */
>>> +static int dm_check_native_cursor_state(struct drm_crtc *new_plane_crtc,
>>> +                    struct drm_plane *plane,
>>> +                    struct drm_plane_state *new_plane_state,
>>> +                    bool enable)
>>> +{
>>> +
>>> +    struct amdgpu_crtc *new_acrtc;
>>> +    int ret;
>>> +
>>> +    if (!enable || !new_plane_crtc ||
>>> +        drm_atomic_plane_disabling(plane->state, new_plane_state))
>>> +        return 0;
>>> +
>>> +    new_acrtc = to_amdgpu_crtc(new_plane_crtc);
>>> +
>>> +    if (new_plane_state->src_x != 0 || new_plane_state->src_y != 0) {
>>> +        DRM_DEBUG_ATOMIC("Cropping not supported for cursor plane\n");
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    if (new_plane_state->fb) {
>>> +        ret = dm_check_cursor_fb(new_acrtc, new_plane_state,
>>> +                        new_plane_state->fb);
>>> +        if (ret)
>>> +            return ret;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static bool dm_should_update_native_cursor(struct drm_atomic_state *state,
>>> +                       struct drm_crtc *old_plane_crtc,
>>> +                       struct drm_crtc *new_plane_crtc,
>>> +                       bool enable)
>>> +{
>>> +    struct drm_crtc_state *old_crtc_state, *new_crtc_state;
>>> +    struct dm_crtc_state *dm_old_crtc_state, *dm_new_crtc_state;
>>> +
>>> +    if (!enable) {
>>> +        if (old_plane_crtc == NULL)
>>> +            return true;
>>> +
>>> +        old_crtc_state = drm_atomic_get_old_crtc_state(
>>> +            state, old_plane_crtc);
>>> +        dm_old_crtc_state = to_dm_crtc_state(old_crtc_state);
>>> +
>>> +        return dm_old_crtc_state->cursor_mode == DM_CURSOR_NATIVE_MODE;
>>> +    } else {
>>> +        if (new_plane_crtc == NULL)
>>> +            return true;
>>> +
>>> +        new_crtc_state = drm_atomic_get_new_crtc_state(
>>> +            state, new_plane_crtc);
>>> +        dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
>>> +
>>> +        return dm_new_crtc_state->cursor_mode == DM_CURSOR_NATIVE_MODE;
>>> +    }
>>> +}
>>> +
>>>   static int dm_update_plane_state(struct dc *dc,
>>>                    struct drm_atomic_state *state,
>>>                    struct drm_plane *plane,
>>> @@ -10231,8 +10321,7 @@ static int dm_update_plane_state(struct dc *dc,
>>>       struct drm_crtc_state *old_crtc_state, *new_crtc_state;
>>>       struct dm_crtc_state *dm_new_crtc_state, *dm_old_crtc_state;
>>>       struct dm_plane_state *dm_new_plane_state, *dm_old_plane_state;
>>> -    struct amdgpu_crtc *new_acrtc;
>>> -    bool needs_reset;
>>> +    bool needs_reset, update_native_cursor;
>>>       int ret = 0;
>>> @@ -10241,24 +10330,16 @@ static int dm_update_plane_state(struct dc *dc,
>>>       dm_new_plane_state = to_dm_plane_state(new_plane_state);
>>>       dm_old_plane_state = to_dm_plane_state(old_plane_state);
>>> -    if (plane->type == DRM_PLANE_TYPE_CURSOR) {
>>> -        if (!enable || !new_plane_crtc ||
>>> -            drm_atomic_plane_disabling(plane->state, new_plane_state))
>>> -            return 0;
>>> -
>>> -        new_acrtc = to_amdgpu_crtc(new_plane_crtc);
>>> -
>>> -        if (new_plane_state->src_x != 0 || new_plane_state->src_y != 0) {
>>> -            DRM_DEBUG_ATOMIC("Cropping not supported for cursor plane\n");
>>> -            return -EINVAL;
>>> -        }
>>> +    update_native_cursor = dm_should_update_native_cursor(state,
>>> +                                  old_plane_crtc,
>>> +                                  new_plane_crtc,
>>> +                                  enable);
>>> -        if (new_plane_state->fb) {
>>> -            ret = dm_check_cursor_fb(new_acrtc, new_plane_state,
>>> -                         new_plane_state->fb);
>>> -            if (ret)
>>> -                return ret;
>>> -        }
>>> +    if (plane->type == DRM_PLANE_TYPE_CURSOR && update_native_cursor) {
>>> +        ret = dm_check_native_cursor_state(new_plane_crtc, plane,
>>> +                                new_plane_state, enable);
>>> +        if (ret)
>>> +            return ret;
>>>           return 0;
>>>       }
>>> @@ -10285,16 +10366,17 @@ static int dm_update_plane_state(struct dc *dc,
>>>                   plane->base.id, old_plane_crtc->base.id);
>>>           ret = dm_atomic_get_state(state, &dm_state);
>>> -        if (ret)
>>> -            return ret;
>>> +        if (ret) {
>>> +            goto out;
>>> +        }
>>>           if (!dc_state_remove_plane(
>>>                   dc,
>>>                   dm_old_crtc_state->stream,
>>>                   dm_old_plane_state->dc_state,
>>>                   dm_state->context)) {
>>> -
>>> -            return -EINVAL;
>>> +            ret = -EINVAL;
>>> +            goto out;
>>>           }
>>>           if (dm_old_plane_state->dc_state)
>>> @@ -10323,21 +10405,16 @@ static int dm_update_plane_state(struct dc *dc,
>>>               return 0;
>>>           ret = amdgpu_dm_plane_helper_check_state(new_plane_state, 
>>> new_crtc_state);
>>> -        if (ret)
>>> -            return ret;
>>> +        if (ret) {
>>> +            goto out;
>>> +        }
>>>           WARN_ON(dm_new_plane_state->dc_state);
>>>           dc_new_plane_state = dc_create_plane_state(dc);
>>> -        if (!dc_new_plane_state)
>>> -            return -ENOMEM;
>>> -
>>> -        /* Block top most plane from being a video plane */
>>> -        if (plane->type == DRM_PLANE_TYPE_OVERLAY) {
>>> -            if 
>>> (amdgpu_dm_plane_is_video_format(new_plane_state->fb->format->format) && 
>>> *is_top_most_overlay)
>>> -                return -EINVAL;
>>> -
>>> -            *is_top_most_overlay = false;
>>> +        if (!dc_new_plane_state) {
>>> +            ret = -ENOMEM;
>>> +            goto out;
>>>           }
>>>           DRM_DEBUG_ATOMIC("Enabling DRM plane: %d on DRM crtc %d\n",
>>> @@ -10350,13 +10427,13 @@ static int dm_update_plane_state(struct dc *dc,
>>>               new_crtc_state);
>>>           if (ret) {
>>>               dc_plane_state_release(dc_new_plane_state);
>>> -            return ret;
>>> +            goto out;
>>>           }
>>>           ret = dm_atomic_get_state(state, &dm_state);
>>>           if (ret) {
>>>               dc_plane_state_release(dc_new_plane_state);
>>> -            return ret;
>>> +            goto out;
>>>           }
>>>           /*
>>> @@ -10373,7 +10450,8 @@ static int dm_update_plane_state(struct dc *dc,
>>>                   dm_state->context)) {
>>>               dc_plane_state_release(dc_new_plane_state);
>>> -            return -EINVAL;
>>> +            ret = -EINVAL;
>>> +            goto out;
>>>           }
>>>           dm_new_plane_state->dc_state = dc_new_plane_state;
>>> @@ -10388,6 +10466,16 @@ static int dm_update_plane_state(struct dc *dc,
>>>           *lock_and_validation_needed = true;
>>>       }
>>> +out:
>>> +    /* If cursor overlay failed, attempt fallback to native mode */
>>> +    if (ret == -EINVAL && plane->type == DRM_PLANE_TYPE_CURSOR) {
>>> +        ret = dm_check_native_cursor_state(new_plane_crtc, plane,
>>> +                            new_plane_state, enable);
>>> +        if (ret) {
>>> +            return ret;
>>> +        }
>>> +        dm_new_crtc_state->cursor_mode = DM_CURSOR_NATIVE_MODE;
>>> +    }
>>>       return ret;
>>>   }
>>> @@ -10544,6 +10632,126 @@ static int add_affected_mst_dsc_crtcs(struct 
>>> drm_atomic_state *state, struct drm
>>>       return drm_dp_mst_add_affected_dsc_crtcs(state, 
>>> &aconnector->mst_root->mst_mgr);
>>>   }
>>> +/**
>>> + * DOC: Cursor Modes - Native vs Overlay
>>> + *
>>> + * In native mode, the cursor uses a integrated cursor pipe within each DCN hw
>>> + * plane. It does not require a dedicated hw plane to enable, but it is
>>> + * subjected to the same z-order and scaling as the hw plane. It also has 
>>> format
>>> + * restrictions, a RGB cursor in native mode cannot be enabled within a non-RGB
>>> + * hw plane.
>>> + *
>>> + * In overlay mode, the cursor uses a separate DCN hw plane, and thus has its
>>> + * own scaling and z-pos. It also has no blending restrictions. It lends to a
>>> + * cursor behavior more akin to a DRM client's expectations. However, it does
>>> + * occupy an extra DCN plane, and therefore will only be used if a DCN plane is
>>> + * available.
>>> +*/
>>> +
>>> +/**
>>> + * Set whether the cursor should be enabled in native mode, or overlay mode, on
>>> + * the dm_crtc_state.
>>> + *
>>> + * The cursor should be enabled in overlay mode if the immediate underlying
>>> + * plane contains a video format.
>>> + *
>>> + * Since zpos info is required, drm_atomic_normalize_zpos must be called before
>>> + * calling this function.
>>> +*/
>>> +static int dm_crtc_set_cursor_mode(struct drm_atomic_state *state,
>>> +                    struct dm_crtc_state *dm_crtc_state)
>>> +{
>>> +    struct drm_plane_state *plane_state, *old_plane_state, *target_plane_state;
>>> +    struct drm_crtc_state *crtc_state = &dm_crtc_state->base;
>>> +    struct drm_plane *plane;
>>> +    bool consider_mode_change = false;
>>> +    bool cursor_changed = false;
>>> +    unsigned int target_zpos;
>>> +    unsigned int cursor_zpos;
>>> +    int i;
>>> +
>>> +    /*
>>> +     * Cursor mode can change if a plane's format changes, is
>>> +     * enabled/disabled, or z-order changes.
>>> +     */
>>> +    for_each_oldnew_plane_in_state(state, plane, old_plane_state, 
>>> plane_state, i) {
>>> +
>>> +        /* Only care about planes on this CRTC */
>>> +        if ((drm_plane_mask(plane) & crtc_state->plane_mask) == 0)
>>> +            continue;
>>> +
>>> +        if (plane->type == DRM_PLANE_TYPE_CURSOR)
>>> +            cursor_changed = true;
>>> +
>>> +        if (drm_atomic_plane_enabling(old_plane_state, plane_state) ||
>>> +            drm_atomic_plane_disabling(old_plane_state, plane_state) ||
>>> +            old_plane_state->fb->format != plane_state->fb->format) {
>>> +            consider_mode_change = true;
>>> +            break;
>>> +        }
>>> +    }
>>> +
>>> +    if (!consider_mode_change && !crtc_state->zpos_changed) {
>>> +        return 0;
>>> +    }
>>> +
>>> +    /*
>>> +     * If no cursor change on this CRTC, and not enabled on this CRTC, then
>>> +     * no need to set cursor mode. This avoids needlessly locking the cursor
>>> +     * state.
>>> +     */
>>> +    if (!cursor_changed &&
>>> +        !(drm_plane_mask(crtc_state->crtc->cursor) & crtc_state->plane_mask)) {
>>> +        return 0;
>>> +    }
>>> +
>>> +    plane_state = drm_atomic_get_plane_state(state,
>>> +                         crtc_state->crtc->cursor);
>>> +    if (IS_ERR(plane_state))
>>> +        return PTR_ERR(plane_state);
>>> +
>>> +    /* Cursor is disabled */
>>> +    if (!plane_state->fb)
>>> +        return 0;
>>> +
>>> +    cursor_zpos = plane_state->normalized_zpos;
>>> +
>>> +    /* Get enabled plane immediately below cursor. */
>>> +    target_plane_state = NULL;
>>> +    target_zpos = 0;
>>> +    drm_for_each_plane_mask(plane, state->dev, crtc_state->plane_mask) {
>>> +        if (plane->type == DRM_PLANE_TYPE_CURSOR)
>>> +            continue;
>>> +
>>> +        plane_state = drm_atomic_get_plane_state(state, plane);
>>> +        if (IS_ERR(plane_state))
>>> +            return PTR_ERR(plane_state);
>>> +
>>> +        if (!plane_state->fb ||
>>> +            plane_state->normalized_zpos >= cursor_zpos)
>>> +            continue;
>>> +
>>> +        if (plane_state->normalized_zpos >= target_zpos) {
>>> +            target_zpos = plane_state->normalized_zpos;
>>> +            target_plane_state = plane_state;
>>> +        }
>>> +    }
>>> +
>>> +    /* Nothing below cursor - use overlay mode */
>>> +    if (target_plane_state == NULL) {
>>> +        dm_crtc_state->cursor_mode = DM_CURSOR_OVERLAY_MODE;
>>> +        return 0;
>>> +    }
>>> +
>>> +    if 
>>> (amdgpu_dm_plane_is_video_format(target_plane_state->fb->format->format)) {
>>> +        dm_crtc_state->cursor_mode = DM_CURSOR_OVERLAY_MODE;
>>> +    } else {
>>> +        dm_crtc_state->cursor_mode = DM_CURSOR_NATIVE_MODE;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   /**
>>>    * amdgpu_dm_atomic_check() - Atomic check implementation for AMDgpu DM.
>>>    *
>>> @@ -10713,6 +10921,20 @@ static int amdgpu_dm_atomic_check(struct drm_device 
>>> *dev,
>>>           goto fail;
>>>       }
>>> +    /*
>>> +     * Determine whether cursors on each CRTC should be enabled in native or
>>> +     * overlay mode.
>>> +     */
>>> +    for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
>>> +        dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
>>> +
>>> +        ret = dm_crtc_set_cursor_mode(state, dm_new_crtc_state);
>>> +        if (ret) {
>>> +            drm_dbg(dev, "Failed to determine cursor mode\n");
>>> +            goto fail;
>>> +        }
>>> +    }
>>> +
>>>       /* Remove exiting planes if they are modified */
>>>       for_each_oldnew_plane_in_state_reverse(state, plane, old_plane_state, 
>>> new_plane_state, i) {
>>>           if (old_plane_state->fb && new_plane_state->fb &&
>>> @@ -10793,6 +11015,11 @@ static int amdgpu_dm_atomic_check(struct drm_device 
>>> *dev,
>>>       /* Check cursor planes scaling */
>>>       for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
>>> +        /* Overlay cusor does not need scaling check */
>>> +        dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
>>> +        if (dm_new_crtc_state->cursor_mode == DM_CURSOR_OVERLAY_MODE)
>>> +            continue;
>>> +
>>>           ret = dm_check_crtc_cursor(state, crtc, new_crtc_state);
>>>           if (ret) {
>>>               DRM_DEBUG_DRIVER("dm_check_crtc_cursor() failed\n");
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h 
>>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>> index 09519b7abf67..b8d39fdd1e09 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>> @@ -822,6 +822,11 @@ struct dm_plane_state {
>>>       enum amdgpu_transfer_function blend_tf;
>>>   };
>>> +enum amdgpu_dm_cursor_mode {
>>> +    DM_CURSOR_NATIVE_MODE = 0,
>>> +    DM_CURSOR_OVERLAY_MODE,
>>> +};
>>> +
>>>   struct dm_crtc_state {
>>>       struct drm_crtc_state base;
>>>       struct dc_stream_state *stream;
>>> @@ -852,6 +857,8 @@ struct dm_crtc_state {
>>>        * encoding.
>>>        */
>>>       enum amdgpu_transfer_function regamma_tf;
>>> +
>>> +    enum amdgpu_dm_cursor_mode cursor_mode;
>>>   };
>>>   #define to_dm_crtc_state(x) container_of(x, struct dm_crtc_state, base)
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c 
>>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
>>> index e23a0a276e33..67aea1d2feb9 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
>>> @@ -304,6 +304,7 @@ static struct drm_crtc_state 
>>> *amdgpu_dm_crtc_duplicate_state(struct drm_crtc *cr
>>>       state->regamma_tf = cur->regamma_tf;
>>>       state->crc_skip_count = cur->crc_skip_count;
>>>       state->mpo_requested = cur->mpo_requested;
>>> +    state->cursor_mode = cur->cursor_mode;
>>>       /* TODO Duplicate dc_stream after objects are stream object is 
>>> flattened */
>>>       return &state->base;
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c 
>>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>>> index 8a4c40b4c27e..ed1fc01f1649 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>>> @@ -104,7 +104,7 @@ void amdgpu_dm_plane_fill_blending_from_plane_state(const 
>>> struct drm_plane_state
>>>       *global_alpha = false;
>>>       *global_alpha_value = 0xff;
>>> -    if (plane_state->plane->type != DRM_PLANE_TYPE_OVERLAY)
>>> +    if (plane_state->plane->type == DRM_PLANE_TYPE_PRIMARY)
>>>           return;
>>>       if (plane_state->pixel_blend_mode == DRM_MODE_BLEND_PREMULTI ||
>>> @@ -1175,10 +1175,21 @@ static int amdgpu_dm_plane_atomic_check(struct 
>>> drm_plane *plane,
>>>   static int amdgpu_dm_plane_atomic_async_check(struct drm_plane *plane,
>>>                             struct drm_atomic_state *state)
>>>   {
>>> +    struct drm_crtc_state *new_crtc_state;
>>> +    struct drm_plane_state *new_plane_state;
>>> +    struct dm_crtc_state *dm_new_crtc_state;
>>> +
>>>       /* Only support async updates on cursor planes. */
>>>       if (plane->type != DRM_PLANE_TYPE_CURSOR)
>>>           return -EINVAL;
>>> +    new_plane_state = drm_atomic_get_new_plane_state(state, plane);
>>> +    new_crtc_state = drm_atomic_get_new_crtc_state(state, 
>>> new_plane_state->crtc);
>>> +    dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
>>> +    /* Reject overlay cursors for now*/
>>> +    if (dm_new_crtc_state->cursor_mode == DM_CURSOR_OVERLAY_MODE)
>>> +        return -EINVAL;
>>> +
>>>       return 0;
>>>   }
