Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDEE78774D
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 19:53:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E8AB10E595;
	Thu, 24 Aug 2023 17:53:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [188.68.63.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E6310E595
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 17:53:09 +0000 (UTC)
Received: from mors-relay8203.netcup.net (localhost [127.0.0.1])
 by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4RWrKH6bckz8Ym7;
 Thu, 24 Aug 2023 17:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zint.sh; s=key2;
 t=1692899587; bh=9z6Wo+e2ikvl+tHAYuVgs7vRHz/NQAhG7IflTB8QWso=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=D2cSF2pDKOhr4Zb6p/zlTICgNyBz5HqSsuO26oRN5Lws632eacB2WDdLZItHAEuJm
 9VQU+evizqSO7/n8X2r/IQQOhK2MXw41chRxzOGBsDuPPLgul30gM2DPjcqe7J2zKA
 Czdl3fzgzTq/8lw6wtHQQg/h3yipnW/OphomW/l6NfhtSxNoFj4NAYoKff371ICOEo
 7vhsZWL4ncFt5F6MhF3YXNk/e1L91areUSQUb+1ssTl7UspQ94QRDoE80QWGNVD22K
 5nISGrjY5KQLvhSLJUdFWKiY+C687PGsi8qnonygaSWOuirvyHNFkOb8WqL+ReJU2L
 W0xtpoyrTU5vQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
 by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4RWrKH5t3Pz8Ym6;
 Thu, 24 Aug 2023 17:53:07 +0000 (UTC)
Received: from mxe217.netcup.net (unknown [10.243.12.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4RWrKG6kntz8sZN;
 Thu, 24 Aug 2023 19:53:06 +0200 (CEST)
Received: from [192.168.33.30] (p5dcce04c.dip0.t-ipconnect.de [93.204.224.76])
 by mxe217.netcup.net (Postfix) with ESMTPSA id 70061819A2;
 Thu, 24 Aug 2023 19:52:51 +0200 (CEST)
Message-ID: <730f3107-f7b6-4260-837e-5ddad3a40e35@zint.sh>
Date: Thu, 24 Aug 2023 19:52:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] backlight: hid_bl: Add VESA VCP HID backlight
 driver
Content-Language: de-DE, en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <20230820094118.20521-1-julius@zint.sh>
 <20230820094118.20521-2-julius@zint.sh>
 <2b7cf5af-1d96-8650-ac93-b1243bab5d7a@wanadoo.fr>
From: Julius Zint <julius@zint.sh>
In-Reply-To: <2b7cf5af-1d96-8650-ac93-b1243bab5d7a@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 70061819A2
X-Rspamd-Server: rspamd-worker-8404
X-NC-CID: /spk1Hi8yFoovRaL0cEh4YroAazUgiTJ3J8Dapvo
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
Cc: linux-fbdev@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Jiri Kosina <jikos@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 linux-input@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20.08.23 12:06, Christophe JAILLET wrote:
> [...]
>
>> +static void hid_bl_remove(struct hid_device *hdev)
>> +{
>> +    struct backlight_device *bl;
>> +    struct hid_bl_data *data;
>> +
>> +    hid_dbg(hdev, "remove\n");
>> +    bl = hid_get_drvdata(hdev);
>> +    data = bl_get_data(bl);
>> +
>> +    devm_backlight_device_unregister(&hdev->dev, bl);
>
> Hi,
>
> If this need to be called here, before the hid_() calls below, there 
> seems to be no real point in using devm_backlight_device_register() / 
> devm_backlight_device_unregister().
>
> The non-devm_ version should be enough.
The non-devm_ version is marked deprecated. As for the order, I am not 
really sure. I am
concerned about someone updating the brightness while its being removed. 
So the HID device
would already have been stopped and then I would issue a request and 
wait for completion.

If hid_hw_request and hid_hw_wait can handle this situation we are fine.
>
>> +    hid_hw_close(hdev);
>> +    hid_hw_stop(hdev);
>> +    hid_set_drvdata(hdev, NULL);
>> +    devm_kfree(&hdev->dev, data);
>
> 'data' is devm_kzalloc()'ed.
> It is likely that this explicit devm_kfree() could be saved. It will 
> be freed by the framework.
>
>> +}
>
> [...]
>
>> +    if (input_field->logical_maximum != 
>> feature_field->logical_maximum) {
>> +        hid_warn(hdev, "maximums do not match: %d / %d\n",
>> +             input_field->logical_maximum,
>> +             feature_field->logical_maximum);
>> +        ret = -ENODEV;
>> +        goto exit_stop;
>> +    }
>> +
>> +    hid_dbg(hdev, "Monitor VESA VCP with brightness control\n");
>> +
>> +    ret = hid_hw_open(hdev);
>> +    if (ret) {
>> +        hid_err(hdev, "hw open failed: %d\n", ret);
>> +        goto exit_stop;
>> +    }
>> +
>> +    data = devm_kzalloc(&hdev->dev, sizeof(*data), GFP_KERNEL);
>> +    if (data == NULL) {
>> +        ret = -ENOMEM;
>> +        goto exit_stop;
>
> exit_free?
> in order to undo the hid_hw_open() just above.
Yes, my mistake. This does not call hid_hw_close(). I will fix it in v4.
>
>> +    }
>> +    data->hdev = hdev;
>> +    data->min_brightness = input_field->logical_minimum;
>> +    data->max_brightness = input_field->logical_maximum;
>> +    data->input_field = input_field;
>> +    data->feature_field = feature_field;
>> +
>> +    memset(&props, 0, sizeof(props));
>> +    props.type = BACKLIGHT_RAW;
>> +    props.max_brightness = data->max_brightness - data->min_brightness;
>> +
>> +    bl = devm_backlight_device_register(&hdev->dev, "vesa_vcp",
>> +                        &hdev->dev, data,
>> +                        &hid_bl_ops,
>> +                        &props);
>> +    if (IS_ERR(bl)) {
>> +        ret = PTR_ERR(bl);
>> +        hid_err(hdev, "failed to register backlight: %d\n", ret);
>> +        goto exit_free;
>> +    }
>> +
>> +    hid_set_drvdata(hdev, bl);
>> +
>> +    return 0;
>> +
>> +exit_free:
>> +    hid_hw_close(hdev);
>> +    devm_kfree(&hdev->dev, data);
>
> 'data' is devm_kzalloc()'ed.
> It is likely that this explicit devm_kfree() could be saved. It will 
> be freed by the framework.
>
>> +
>> +exit_stop:
>> +    hid_hw_stop(hdev);
>> +    return ret;
>> +}
>
> [...]
I will remove all of the explicit calls to devm_kfree (and others) in v4 
(and test it thoroughly).

Thank you for the helpful review.

Julius

