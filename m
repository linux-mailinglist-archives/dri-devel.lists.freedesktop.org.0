Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E27164EB82
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 13:39:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3191710E004;
	Fri, 16 Dec 2022 12:39:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B46CF10E004;
 Fri, 16 Dec 2022 12:39:09 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 6A85E5C0105;
 Fri, 16 Dec 2022 07:39:06 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Fri, 16 Dec 2022 07:39:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1671194346; x=
 1671280746; bh=v13bQYs2n+9QBeyAU8UmiJ8+cb8v3Ev1Pl4Y5TMgwH8=; b=j
 JWqk0txtOZiWrct3dFGDcC8TKG/oDmLBuOKg6EIjKEsjbVbg+G2PtnYjB6HdPr8a
 MxyBCzENdMTWO6xZHX/kgTovst5huAAzoVbSzfHyXPe2VsTrOkGBU9yniekm+a60
 w0dLJM28NpxvV8EtX1aJ32hX4sDiT0SUrDa8avXUN4d9GkfS+NAeyn9uGad5yGjy
 JgrhTbBJdV2TJBdNrS1hvUryYN5AT9SORGTMHcZRSgPyRG9PcRz2tMsXSdOK96ZQ
 B7Ty0cstN06W+wUh+o+0/6Vn3u37Z6q0woQwJ0K0LRIFITsiozwjo66h6TgCZPd8
 r1BbDwmRoZhEyQJE86V9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1671194346; x=
 1671280746; bh=v13bQYs2n+9QBeyAU8UmiJ8+cb8v3Ev1Pl4Y5TMgwH8=; b=m
 Hgb8DPVRCUzX12DLRvXbjCCMspLJ7JLst+KQ1gV0ELEV+J4Hoqv88Wt0gQtnH9UN
 WzrvBYBVW8LzTNunP1+IFiVlJxMDKhkWAQRSrzOBXvYwh0lotKvBMzVI5fAmzmyX
 H+UklUgSVhiiQHHSdb9OfAl8XLO4nJpXlD4uhYR4bjv3tJejJpiCaozsTJT4nKaz
 HT8zNabF6Y8Z6Cb6oXJz+/0/uweYGpy4YHt2XdP65CkA8Kdae9PUXZDbCJzYH8fo
 tY4SPqMEmraS3AtXCJkmh6UxNbWURJaBCcLeTxJmacNSIOXs07jVzkUrZTaP/q8T
 W8ccgyDBkpXrSIkRPOzLg==
X-ME-Sender: <xms:6macY-5R5qod0JjeEr7qy9DfsHC0b71XuKh6ePwTYLCPNTYhR_XJDw>
 <xme:6macY37SCuX9VwnDHIzNwyc7H3UgLulBV93LoSL6CE3qCvEbggp-1kEm7bb6Eib7E
 8vUVKMppkE4r7ig91g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeejgdegvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfg
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:6macY9crQYbkLe3P53NCpvtfWtiZbuN3lSsv1YkbUHkvR_cvnHLkyw>
 <xmx:6macY7JAOtgFcXIiCsggQo3dFbtmBGaoCM74UTKFjYIETaaaUZPMCw>
 <xmx:6macYyI8SaNxTt8Dr-XY3g7Slyr3S6KI_QBbA_87I0oKiepuhvMYXg>
 <xmx:6macY9axU8M2qGEpKljuhbp_9NpM7j9v9pMd_3pOP49N1kp5KR61Tw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 24D2BB60086; Fri, 16 Dec 2022 07:39:06 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1185-g841157300a-fm-20221208.002-g84115730
Mime-Version: 1.0
Message-Id: <f7900514-15d1-4da8-a330-ddd2d68a426e@app.fastmail.com>
In-Reply-To: <dc11c746-7d06-4b9f-ddc4-9b8e72297e3f@mailbox.org>
References: <20221215163743.452648-1-arnd@kernel.org>
 <dc11c746-7d06-4b9f-ddc4-9b8e72297e3f@mailbox.org>
Date: Fri, 16 Dec 2022 13:38:45 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 "Arnd Bergmann" <arnd@kernel.org>, "Harry Wentland" <harry.wentland@amd.com>, 
 "Leo Li" <sunpeng.li@amd.com>, "Rodrigo Siqueira" <Rodrigo.Siqueira@amd.com>
Subject: Re: [PATCH] drm/amd/display: fix dp_retrieve_lttpr_cap return code
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Alan Liu <HaoPing.Liu@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 George Shen <george.shen@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 15, 2022, at 18:56, Michel D=C3=A4nzer wrote:
> On 12/15/22 17:37, Arnd Bergmann wrote:
/amd/display/dc/core/dc_link_dp.c
>> index af9411ee3c74..95dbfa4e996a 100644
>> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
>> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
>> @@ -5095,7 +5095,7 @@ enum dc_status dp_retrieve_lttpr_cap(struct dc_=
link *link)
>>  	bool vbios_lttpr_interop =3D link->dc->caps.vbios_lttpr_aware;
>> =20
>>  	if (!vbios_lttpr_interop || !link->dc->caps.extended_aux_timeout_su=
pport)
>> -		return false;
>> +		return DC_OK;
>
> 		return status;
>
> seems more appropriate. (Otherwise the status =3D DC_ERROR_UNEXPECTED=20
> initialization has no effect)

Ok, makes sense. I'd also remove the unused initialization in that
case though:

 enum dc_status dp_retrieve_lttpr_cap(struct dc_link *link)
 {
        uint8_t lttpr_dpcd_data[8];
-       enum dc_status status =3D DC_ERROR_UNEXPECTED;
-       bool is_lttpr_present =3D false;
+       enum dc_status status;
+       bool is_lttpr_present;
=20
        /* Logic to determine LTTPR support*/
        bool vbios_lttpr_interop =3D link->dc->caps.vbios_lttpr_aware;
=20
        if (!vbios_lttpr_interop || !link->dc->caps.extended_aux_timeout=
_support)
-               return false;
+               return DC_ERROR_UNEXPECTED;
=20
        /* By reading LTTPR capability, RX assumes that we will enable
         * LTTPR extended aux timeout if LTTPR is present.

I'll send that as a v2 once that passes my build test and nobody
has further suggestions.

       Arnd
