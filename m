Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA77B9D1CD
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 04:15:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B64CE10E81F;
	Thu, 25 Sep 2025 02:15:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.b="TEavOXR6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 54654 seconds by postgrey-1.36 at gabe;
 Thu, 25 Sep 2025 02:15:39 UTC
Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com
 [162.62.57.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D16D810E81F;
 Thu, 25 Sep 2025 02:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1758766530; bh=fcD01+IidMZF3SXHax3XfvZWRinwknGek4h6cP7M1Oc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=TEavOXR6JCxX7kM5oHAnN+zeg7ll6zwbjOPXGOHOkNQtQz2NjOaisHkr/DmCopqeA
 hVWTk9M6vmgTslIJtV5fbub8jO+KhSc+1jt+9QrErvOR6tA2pcJElELMGZdgqn1CwE
 4kXarq/I9hSlKRQhQTWWLRlt7wxI0XzHQQWec84Q=
Received: from [10.42.17.171] ([116.128.244.169])
 by newxmesmtplogicsvrszb20-1.qq.com (NewEsmtp) with SMTP
 id 3DC9C4C2; Thu, 25 Sep 2025 10:15:28 +0800
X-QQ-mid: xmsmtpt1758766528trmz7vw9y
Message-ID: <tencent_7AF1E2F3165B0245452856F1D20BA2F21205@qq.com>
X-QQ-XMAILINFO: NQR8mRxMnur9dGoyL5Lt8Zv65ajNy5UKWbDeD7VN5n9rN6BVru39J1DfcZzxkS
 O3EaMDtvVHlDleBhMCA/FtsGIQjx6BVVaoLnal8qEULx2JvnDL9ECm8VXE7+UVCgo9vWSrlEJsT8
 z7mibjOWUhLP1yKcy0h2Don634mKgzgVqWPn5tAm4Ku3gih855FWFm+zw+lJjJo4SVMtRokVD0kP
 oIwWpfJJ1UoysAxT7tjNjqcrNEztBtYg9tzVAwgnthxMu5CjedFVIzfx/8NdCzU/XWBCJDGSMoHP
 gejBD31Z8OizKYm001PbwfxvcyNT5gQKLHlnVvB3wxr0YbcBB6LruyZvI2JX6PAzzea5TXr4Wp8C
 xXg1bLrMhlTPrTvN3+brl5KT/RB5b8JI9QQCy78BhTPH07BXt2DL198SklAQjgzSzadXV2kQajWb
 B2f9FL2Yurjll5+yJ4mYFDcbFE3TQWnW++2c5nCy+XukDkubsraSAvnCyUU7lAqDNKDKj84ZISlC
 bc+PkPl8hF7DL8xPSZoOxrxAxobP5rJKaEv3a+QhdenRt/P5keowBSEgWgf2TnD5RLnrs3QLAfFo
 2jEu0s5+2Ya3x9yCiCYzzfsdFQ1mlvdpU/P46FFhhBy+2QECc57zc8unIitdT6A7XXCuwgOM1AmI
 lsp2nniuvgY7gohikuzL5Eqf76UA8svnT6KuZbrbfASNFxN75zbvAzW+GStOxAtUjH+aPn/pX5ac
 1GKHzjvSRfs8/OOz84vssWdbPgBAi9KuBKJdRAoJk/tMjqEDQenCZbwHWbqL6rhky0fqkTEaf1ZE
 O3GnOdiGmFA11d9FyO1XawejD9rhvQikQ/eClNZST3vzAxFX9TSmdtR/Moq59LKyQMAYE8X0RVau
 CT12VmD8thT/r02hj3a0ddR0QYr8KM6dk5xLXQIOi4aXMllZ5eM24VbMCYhj7eGYMxwLfo26M1US
 WPs/WYoZzG5ews9nIJEeW39AwlXu176FgSO/wZXDthgvbwG+qCDBl5KBhPkKUAEf/NAbnkomP+10
 JG3ltzkEZEsSSMDQm6x5PBdq7ume3ShjWwtUT0nka3r7iHvCNaJJAvs+A54DRORWFIVIstLaYzyz
 aSAjrblm+5n90ItHM=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
Content-Type: multipart/alternative;
 boundary="------------9b2EWMxnb3wtAFbiAuqBeoq0"
X-OQ-MSGID: <1bd4ac7d-6996-40ee-a352-20da3b99cf6e@qq.com>
Date: Thu, 25 Sep 2025 10:15:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/radeon: Solve the problem of the audio options not
 disappearing promptly after unplugging the HDMI audio.
To: Alex Deucher <alexdeucher@gmail.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Wang Jiang <jiangwang@kylinos.cn>
References: <tencent_A8BB4A0E44BDCF1DEC33942D2144C521AF07@qq.com>
 <CADnq5_PCGv7a4azG+mhv+=Jmp74-O73iUnZctLkNYKabRGcwMg@mail.gmail.com>
From: jiangwang <2564278112@qq.com>
In-Reply-To: <CADnq5_PCGv7a4azG+mhv+=Jmp74-O73iUnZctLkNYKabRGcwMg@mail.gmail.com>
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

This is a multi-part message in MIME format.
--------------9b2EWMxnb3wtAFbiAuqBeoq0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Sorry, my previous description may not have been accurate enough.
When|radeon_audio_detect|is triggered, the disconnected state of the 
connector has not yet been uploaded to DRM.
This prevents other components (functions not included 
in|radeon_dvi_detect|/|radeon_dp_detect|) from retrieving the latest 
state of the connector.
|radeon_audio_component_notify|is a function 
within|radeon_dvi_detect|/|radeon_dp_detect|,
while|radeon_audio_component_get_eld|is a callback function used by the 
audio component (|snd_hda_intel|).
Its triggering works as follows:|radeon_audio_component_notify|notifies 
the audio component to retrieve the latest state,
but when|radeon_audio_component_get_eld|actually 
executes,|radeon_dvi_detect|/|radeon_dp_detect|has not yet completed, 
resulting in incorrect retrieval of the connector's state.
You mentioned this looks like a race condition, and that is indeed the 
case, but their starting points are different.
Furthermore,|radeon_audio_component_notify|already 
has|mutex_lock(&connector->eld_mutex)|and|mutex_unlock(&connector->eld_mutex)|, 

staticvoidradeon_audio_component_notify(structradeon_device*rdev, intport)
{
structdrm_audio_component*acomp;
mutex_lock(&rdev->audio.component_mutex);
acomp=rdev->audio.component;
if(acomp&&acomp->audio_ops&&acomp->audio_ops->pin_eld_notify)
acomp->audio_ops->pin_eld_notify(acomp->audio_ops->audio_ptr,
port, -1);
mutex_unlock(&rdev->audio.component_mutex);
}

but this doesn't work 
because|radeon_audio_component_notify|and|radeon_audio_component_get_eld|do 
not have a hierarchical relationship;
  instead, it's an indirect notification-based 
relationship.|radeon_audio_component_notify|notifies|snd_hda_intel|, and 
then|snd_hda_intel|executes|radeon_audio_component_get_eld|.
Unless we acquire the lock in|radeon_audio_component_notify|and release 
it in|radeon_audio_component_get_eld|—but this could lead to a deadlock,
  because|radeon_audio_component_get_eld|is triggered through more means 
than just|radeon_audio_component_notify|.



在 2025/9/25 01:58, Alex Deucher 写道:
> On Wed, Sep 24, 2025 at 7:44 AM<2564278112@qq.com> wrote:
>> From: Wang Jiang<jiangwang@kylinos.cn>
>>
>> The audio detection process in the Radeon driver is as follows:
>> radeon_dvi_detect/radeon_dp_detect -> radeon_audio_detect -> radeon_audio_enable -> radeon_audio_component_notify -> radeon_audio_component_get_eld
>> When HDMI is unplugged, radeon_dvi_detect is triggered.
>> At this point, radeon_audio_detect is triggered before radeon_dvi_detect has finished (which also means the new state of the connector has not been reported).
>> In this scenario, radeon_audio_detect can detect that the connector is disconnected (because the parameter is passed down),
>>   but it is very likely that the audio callback function radeon_audio_component_get_eld cannot detect the disconnection of the connector.
>> As a result, when the audio component (radeon_audio_component_get_eld) performs detection, the connector's state is not shown as disconnected,
>> and connector->eld is not zero, causing the audio component to think the audio driver is still working.
>> I have added a new member (enable_mask) to the audio structure to record the audio enable status.
>> Only when radeon_audio_component_get_eld detects that enable_mask is not zero will it continue to work.
>> There might be other solutions, such as placing radeon_audio_detect/radeon_audio_component_notify after the completion of radeon_XX_detect.
>> However, I found that this would require significant changes (or perhaps it's just my limited coding skills?).
> This still looks like a race.  I think the get_eld() callback can get
> called whenever.  The proper fix is probably to hold the
> connector->eld_mutex in radeon_audio_detect().
>
> Alex
>
>> Signed-off-by: Wang Jiang<jiangwang@kylinos.cn>
>> ---
>>   drivers/gpu/drm/radeon/radeon.h       | 1 +
>>   drivers/gpu/drm/radeon/radeon_audio.c | 5 +++++
>>   2 files changed, 6 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
>> index 63c47585afbc..2d0a411e3ed6 100644
>> --- a/drivers/gpu/drm/radeon/radeon.h
>> +++ b/drivers/gpu/drm/radeon/radeon.h
>> @@ -1745,6 +1745,7 @@ struct r600_audio_pin {
>>          u32                     offset;
>>          bool                    connected;
>>          u32                     id;
>> +       u8                      enable_mask;
>>   };
>>
>>   struct r600_audio {
>> diff --git a/drivers/gpu/drm/radeon/radeon_audio.c b/drivers/gpu/drm/radeon/radeon_audio.c
>> index 8d64ba18572e..a0717895cc8a 100644
>> --- a/drivers/gpu/drm/radeon/radeon_audio.c
>> +++ b/drivers/gpu/drm/radeon/radeon_audio.c
>> @@ -212,6 +212,7 @@ static void radeon_audio_enable(struct radeon_device *rdev,
>>          if (rdev->audio.funcs->enable)
>>                  rdev->audio.funcs->enable(rdev, pin, enable_mask);
>>
>> +       rdev->audio.pin[pin->id].enable_mask = enable_mask;
>>          radeon_audio_component_notify(rdev, pin->id);
>>   }
>>
>> @@ -274,6 +275,7 @@ int radeon_audio_init(struct radeon_device *rdev)
>>                  rdev->audio.pin[i].connected = false;
>>                  rdev->audio.pin[i].offset = pin_offsets[i];
>>                  rdev->audio.pin[i].id = i;
>> +               rdev->audio.pin[i].enable_mask = 0;
>>          }
>>
>>          radeon_audio_interface_init(rdev);
>> @@ -760,6 +762,9 @@ static int radeon_audio_component_get_eld(struct device *kdev, int port,
>>          if (!rdev->audio.enabled || !rdev->mode_info.mode_config_initialized)
>>                  return 0;
>>
>> +       if (rdev->audio.pin[port].enable_mask == 0)
>> +               return 0;
>> +
>>          list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
>>                  const struct drm_connector_helper_funcs *connector_funcs =
>>                                  connector->helper_private;
>> --
>> 2.25.1
>>
--------------9b2EWMxnb3wtAFbiAuqBeoq0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <div
class=3D"auto-hide-last-sibling-br paragraph-JOTKXA paragraph-element br-=
paragraph-space"
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border: 0px so=
lid; margin-top: var(--md-box-body-margin-top); margin-right: var(--md-bo=
x-body-margin-right); margin-bottom: var(--md-box-body-margin-bottom); ma=
rgin-left: var(--md-box-body-margin-left); padding-top: var(--md-box-body=
-padding-top); padding-right: var(--md-box-body-padding-right); padding-b=
ottom: var(--md-box-body-padding-bottom); padding-left: var(--md-box-body=
-padding-left); line-height: var(--md-box-body-line-height); overflow-anc=
hor: auto; font-size: 16px; font-weight: 400; color: var(--md-box-body-co=
lor,var(--md-box-global-text-color)); font-family: Inter, -apple-system, =
BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;PingFang SC&quot;, &quot;=
Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue=
&quot;, Helvetica, Arial, sans-serif; font-style: normal; font-variant-li=
gatures: normal; font-variant-caps: normal; letter-spacing: normal; orpha=
ns: 2; text-align: start; text-indent: 0px; text-transform: none; white-s=
pace: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; background-color: rgb(255, 255, 255); text-decoration-thickness: initi=
al; text-decoration-style: initial; text-decoration-color: initial;">Sorr=
y,
      my previous description may not have been accurate enough.</div>
    <div
class=3D"container-utlnW2 md-box-line-break wrapper-d0Cc1k undefined"
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border: 0px so=
lid; margin-top: var(--md-box-paragraph-spacing); margin-right: 0px; marg=
in-bottom: 0px; margin-left: 0px; padding: 0px; display: block; user-sele=
ct: none; visibility: hidden; overflow-anchor: auto; color: rgb(0, 0, 0);=
 font-family: Inter, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&qu=
ot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microso=
ft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;=
 font-size: 16px; font-style: normal; font-variant-ligatures: normal; fon=
t-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans=
: 2; text-align: start; text-indent: 0px; text-transform: none; white-spa=
ce: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 background-color: rgb(255, 255, 255); text-decoration-thickness: initial=
; text-decoration-style: initial; text-decoration-color: initial;"></div>=

    <div
class=3D"auto-hide-last-sibling-br paragraph-JOTKXA paragraph-element br-=
paragraph-space"
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border: 0px so=
lid; margin-top: var(--md-box-body-margin-top); margin-right: var(--md-bo=
x-body-margin-right); margin-bottom: var(--md-box-body-margin-bottom); ma=
rgin-left: var(--md-box-body-margin-left); padding-top: var(--md-box-body=
-padding-top); padding-right: var(--md-box-body-padding-right); padding-b=
ottom: var(--md-box-body-padding-bottom); padding-left: var(--md-box-body=
-padding-left); line-height: var(--md-box-body-line-height); overflow-anc=
hor: auto; font-size: 16px; font-weight: 400; color: var(--md-box-body-co=
lor,var(--md-box-global-text-color)); font-family: Inter, -apple-system, =
BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;PingFang SC&quot;, &quot;=
Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue=
&quot;, Helvetica, Arial, sans-serif; font-style: normal; font-variant-li=
gatures: normal; font-variant-caps: normal; letter-spacing: normal; orpha=
ns: 2; text-align: start; text-indent: 0px; text-transform: none; white-s=
pace: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; background-color: rgb(255, 255, 255); text-decoration-thickness: initi=
al; text-decoration-style: initial; text-decoration-color: initial;">When=
<span>=C2=A0</span><code
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border-width: =
var(--md-box-inline-code-border-width); border-style: var(--md-box-inline=
-code-border-style); border-color: var(--md-box-inline-code-border-color)=
; border-image: initial; margin-top: var(--md-box-inline-code-margin-top)=
; margin-right: var(--md-box-inline-code-margin-right); margin-bottom: va=
r(--md-box-inline-code-margin-bottom); margin-left: var(--md-box-inline-c=
ode-margin-left); padding-top: var(--md-box-inline-code-padding-top); pad=
ding-right: var(--md-box-inline-code-padding-right); padding-bottom: var(=
--md-box-inline-code-padding-bottom); padding-left: var(--md-box-inline-c=
ode-padding-left); font-family: var(--md-box-global-font-family-mono); fo=
nt-feature-settings: var(--default-mono-font-feature-settings,normal); fo=
nt-size: var(--md-box-samantha-normal-text-font-size); font-variation-set=
tings: var(--default-mono-font-variation-settings,normal); background-ima=
ge: ; background-position-x: ; background-position-y: ; background-size: =
; background-repeat-x: ; background-repeat-y: ; background-attachment: ; =
background-origin: ; background-clip: ; background-color: var(--md-box-in=
line-code-background); border-radius: var(--md-box-inline-code-border-rad=
ius); color: var(--md-box-samantha-normal-text-color) !important; overflo=
w-anchor: auto; font-weight: 400; line-height: var(--md-box-samantha-norm=
al-text-line-height);">radeon_audio_detect</code><span>=C2=A0</span>is
      triggered, the disconnected state of the connector has not yet
      been uploaded to DRM.=C2=A0</div>
    <div
class=3D"auto-hide-last-sibling-br paragraph-JOTKXA paragraph-element br-=
paragraph-space"
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border: 0px so=
lid; margin-top: var(--md-box-body-margin-top); margin-right: var(--md-bo=
x-body-margin-right); margin-bottom: var(--md-box-body-margin-bottom); ma=
rgin-left: var(--md-box-body-margin-left); padding-top: var(--md-box-body=
-padding-top); padding-right: var(--md-box-body-padding-right); padding-b=
ottom: var(--md-box-body-padding-bottom); padding-left: var(--md-box-body=
-padding-left); line-height: var(--md-box-body-line-height); overflow-anc=
hor: auto; font-size: 16px; font-weight: 400; color: var(--md-box-body-co=
lor,var(--md-box-global-text-color)); font-family: Inter, -apple-system, =
BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;PingFang SC&quot;, &quot;=
Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue=
&quot;, Helvetica, Arial, sans-serif; font-style: normal; font-variant-li=
gatures: normal; font-variant-caps: normal; letter-spacing: normal; orpha=
ns: 2; text-align: start; text-indent: 0px; text-transform: none; white-s=
pace: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; background-color: rgb(255, 255, 255); text-decoration-thickness: initi=
al; text-decoration-style: initial; text-decoration-color: initial;">This=

      prevents other components (functions not included in<span>=C2=A0</s=
pan><code
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border-width: =
var(--md-box-inline-code-border-width); border-style: var(--md-box-inline=
-code-border-style); border-color: var(--md-box-inline-code-border-color)=
; border-image: initial; margin-top: var(--md-box-inline-code-margin-top)=
; margin-right: var(--md-box-inline-code-margin-right); margin-bottom: va=
r(--md-box-inline-code-margin-bottom); margin-left: var(--md-box-inline-c=
ode-margin-left); padding-top: var(--md-box-inline-code-padding-top); pad=
ding-right: var(--md-box-inline-code-padding-right); padding-bottom: var(=
--md-box-inline-code-padding-bottom); padding-left: var(--md-box-inline-c=
ode-padding-left); font-family: var(--md-box-global-font-family-mono); fo=
nt-feature-settings: var(--default-mono-font-feature-settings,normal); fo=
nt-size: var(--md-box-samantha-normal-text-font-size); font-variation-set=
tings: var(--default-mono-font-variation-settings,normal); background-ima=
ge: ; background-position-x: ; background-position-y: ; background-size: =
; background-repeat-x: ; background-repeat-y: ; background-attachment: ; =
background-origin: ; background-clip: ; background-color: var(--md-box-in=
line-code-background); border-radius: var(--md-box-inline-code-border-rad=
ius); color: var(--md-box-samantha-normal-text-color) !important; overflo=
w-anchor: auto; font-weight: 400; line-height: var(--md-box-samantha-norm=
al-text-line-height);">radeon_dvi_detect</code>/<code
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border-width: =
var(--md-box-inline-code-border-width); border-style: var(--md-box-inline=
-code-border-style); border-color: var(--md-box-inline-code-border-color)=
; border-image: initial; margin-top: var(--md-box-inline-code-margin-top)=
; margin-right: var(--md-box-inline-code-margin-right); margin-bottom: va=
r(--md-box-inline-code-margin-bottom); margin-left: var(--md-box-inline-c=
ode-margin-left); padding-top: var(--md-box-inline-code-padding-top); pad=
ding-right: var(--md-box-inline-code-padding-right); padding-bottom: var(=
--md-box-inline-code-padding-bottom); padding-left: var(--md-box-inline-c=
ode-padding-left); font-family: var(--md-box-global-font-family-mono); fo=
nt-feature-settings: var(--default-mono-font-feature-settings,normal); fo=
nt-size: var(--md-box-samantha-normal-text-font-size); font-variation-set=
tings: var(--default-mono-font-variation-settings,normal); background-ima=
ge: ; background-position-x: ; background-position-y: ; background-size: =
; background-repeat-x: ; background-repeat-y: ; background-attachment: ; =
background-origin: ; background-clip: ; background-color: var(--md-box-in=
line-code-background); border-radius: var(--md-box-inline-code-border-rad=
ius); color: var(--md-box-samantha-normal-text-color) !important; overflo=
w-anchor: auto; font-weight: 400; line-height: var(--md-box-samantha-norm=
al-text-line-height);">radeon_dp_detect</code>)
      from retrieving the latest state of the connector.</div>
    <div
class=3D"container-utlnW2 md-box-line-break wrapper-d0Cc1k undefined"
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border: 0px so=
lid; margin-top: var(--md-box-paragraph-spacing); margin-right: 0px; marg=
in-bottom: 0px; margin-left: 0px; padding: 0px; display: block; user-sele=
ct: none; visibility: hidden; overflow-anchor: auto; color: rgb(0, 0, 0);=
 font-family: Inter, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&qu=
ot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microso=
ft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;=
 font-size: 16px; font-style: normal; font-variant-ligatures: normal; fon=
t-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans=
: 2; text-align: start; text-indent: 0px; text-transform: none; white-spa=
ce: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 background-color: rgb(255, 255, 255); text-decoration-thickness: initial=
; text-decoration-style: initial; text-decoration-color: initial;"></div>=

    <div
class=3D"auto-hide-last-sibling-br paragraph-JOTKXA paragraph-element br-=
paragraph-space"
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border: 0px so=
lid; margin-top: var(--md-box-body-margin-top); margin-right: var(--md-bo=
x-body-margin-right); margin-bottom: var(--md-box-body-margin-bottom); ma=
rgin-left: var(--md-box-body-margin-left); padding-top: var(--md-box-body=
-padding-top); padding-right: var(--md-box-body-padding-right); padding-b=
ottom: var(--md-box-body-padding-bottom); padding-left: var(--md-box-body=
-padding-left); line-height: var(--md-box-body-line-height); overflow-anc=
hor: auto; font-size: 16px; font-weight: 400; color: var(--md-box-body-co=
lor,var(--md-box-global-text-color)); font-family: Inter, -apple-system, =
BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;PingFang SC&quot;, &quot;=
Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue=
&quot;, Helvetica, Arial, sans-serif; font-style: normal; font-variant-li=
gatures: normal; font-variant-caps: normal; letter-spacing: normal; orpha=
ns: 2; text-align: start; text-indent: 0px; text-transform: none; white-s=
pace: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; background-color: rgb(255, 255, 255); text-decoration-thickness: initi=
al; text-decoration-style: initial; text-decoration-color: initial;"><cod=
e
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border-width: =
var(--md-box-inline-code-border-width); border-style: var(--md-box-inline=
-code-border-style); border-color: var(--md-box-inline-code-border-color)=
; border-image: initial; margin-top: var(--md-box-inline-code-margin-top)=
; margin-right: var(--md-box-inline-code-margin-right); margin-bottom: va=
r(--md-box-inline-code-margin-bottom); margin-left: var(--md-box-inline-c=
ode-margin-left); padding-top: var(--md-box-inline-code-padding-top); pad=
ding-right: var(--md-box-inline-code-padding-right); padding-bottom: var(=
--md-box-inline-code-padding-bottom); padding-left: var(--md-box-inline-c=
ode-padding-left); font-family: var(--md-box-global-font-family-mono); fo=
nt-feature-settings: var(--default-mono-font-feature-settings,normal); fo=
nt-size: var(--md-box-samantha-normal-text-font-size); font-variation-set=
tings: var(--default-mono-font-variation-settings,normal); background-ima=
ge: ; background-position-x: ; background-position-y: ; background-size: =
; background-repeat-x: ; background-repeat-y: ; background-attachment: ; =
background-origin: ; background-clip: ; background-color: var(--md-box-in=
line-code-background); border-radius: var(--md-box-inline-code-border-rad=
ius); color: var(--md-box-samantha-normal-text-color) !important; overflo=
w-anchor: auto; font-weight: 400; line-height: var(--md-box-samantha-norm=
al-text-line-height);">radeon_audio_component_notify</code><span>=C2=A0</=
span>is
      a function within<span>=C2=A0</span><code
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border-width: =
var(--md-box-inline-code-border-width); border-style: var(--md-box-inline=
-code-border-style); border-color: var(--md-box-inline-code-border-color)=
; border-image: initial; margin-top: var(--md-box-inline-code-margin-top)=
; margin-right: var(--md-box-inline-code-margin-right); margin-bottom: va=
r(--md-box-inline-code-margin-bottom); margin-left: var(--md-box-inline-c=
ode-margin-left); padding-top: var(--md-box-inline-code-padding-top); pad=
ding-right: var(--md-box-inline-code-padding-right); padding-bottom: var(=
--md-box-inline-code-padding-bottom); padding-left: var(--md-box-inline-c=
ode-padding-left); font-family: var(--md-box-global-font-family-mono); fo=
nt-feature-settings: var(--default-mono-font-feature-settings,normal); fo=
nt-size: var(--md-box-samantha-normal-text-font-size); font-variation-set=
tings: var(--default-mono-font-variation-settings,normal); background-ima=
ge: ; background-position-x: ; background-position-y: ; background-size: =
; background-repeat-x: ; background-repeat-y: ; background-attachment: ; =
background-origin: ; background-clip: ; background-color: var(--md-box-in=
line-code-background); border-radius: var(--md-box-inline-code-border-rad=
ius); color: var(--md-box-samantha-normal-text-color) !important; overflo=
w-anchor: auto; font-weight: 400; line-height: var(--md-box-samantha-norm=
al-text-line-height);">radeon_dvi_detect</code>/<code
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border-width: =
var(--md-box-inline-code-border-width); border-style: var(--md-box-inline=
-code-border-style); border-color: var(--md-box-inline-code-border-color)=
; border-image: initial; margin-top: var(--md-box-inline-code-margin-top)=
; margin-right: var(--md-box-inline-code-margin-right); margin-bottom: va=
r(--md-box-inline-code-margin-bottom); margin-left: var(--md-box-inline-c=
ode-margin-left); padding-top: var(--md-box-inline-code-padding-top); pad=
ding-right: var(--md-box-inline-code-padding-right); padding-bottom: var(=
--md-box-inline-code-padding-bottom); padding-left: var(--md-box-inline-c=
ode-padding-left); font-family: var(--md-box-global-font-family-mono); fo=
nt-feature-settings: var(--default-mono-font-feature-settings,normal); fo=
nt-size: var(--md-box-samantha-normal-text-font-size); font-variation-set=
tings: var(--default-mono-font-variation-settings,normal); background-ima=
ge: ; background-position-x: ; background-position-y: ; background-size: =
; background-repeat-x: ; background-repeat-y: ; background-attachment: ; =
background-origin: ; background-clip: ; background-color: var(--md-box-in=
line-code-background); border-radius: var(--md-box-inline-code-border-rad=
ius); color: var(--md-box-samantha-normal-text-color) !important; overflo=
w-anchor: auto; font-weight: 400; line-height: var(--md-box-samantha-norm=
al-text-line-height);">radeon_dp_detect</code>,=C2=A0</div>
    <div
class=3D"auto-hide-last-sibling-br paragraph-JOTKXA paragraph-element br-=
paragraph-space"
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border: 0px so=
lid; margin-top: var(--md-box-body-margin-top); margin-right: var(--md-bo=
x-body-margin-right); margin-bottom: var(--md-box-body-margin-bottom); ma=
rgin-left: var(--md-box-body-margin-left); padding-top: var(--md-box-body=
-padding-top); padding-right: var(--md-box-body-padding-right); padding-b=
ottom: var(--md-box-body-padding-bottom); padding-left: var(--md-box-body=
-padding-left); line-height: var(--md-box-body-line-height); overflow-anc=
hor: auto; font-size: 16px; font-weight: 400; color: var(--md-box-body-co=
lor,var(--md-box-global-text-color)); font-family: Inter, -apple-system, =
BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;PingFang SC&quot;, &quot;=
Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue=
&quot;, Helvetica, Arial, sans-serif; font-style: normal; font-variant-li=
gatures: normal; font-variant-caps: normal; letter-spacing: normal; orpha=
ns: 2; text-align: start; text-indent: 0px; text-transform: none; white-s=
pace: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; background-color: rgb(255, 255, 255); text-decoration-thickness: initi=
al; text-decoration-style: initial; text-decoration-color: initial;">whil=
e<span>=C2=A0</span><code
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border-width: =
var(--md-box-inline-code-border-width); border-style: var(--md-box-inline=
-code-border-style); border-color: var(--md-box-inline-code-border-color)=
; border-image: initial; margin-top: var(--md-box-inline-code-margin-top)=
; margin-right: var(--md-box-inline-code-margin-right); margin-bottom: va=
r(--md-box-inline-code-margin-bottom); margin-left: var(--md-box-inline-c=
ode-margin-left); padding-top: var(--md-box-inline-code-padding-top); pad=
ding-right: var(--md-box-inline-code-padding-right); padding-bottom: var(=
--md-box-inline-code-padding-bottom); padding-left: var(--md-box-inline-c=
ode-padding-left); font-family: var(--md-box-global-font-family-mono); fo=
nt-feature-settings: var(--default-mono-font-feature-settings,normal); fo=
nt-size: var(--md-box-samantha-normal-text-font-size); font-variation-set=
tings: var(--default-mono-font-variation-settings,normal); background-ima=
ge: ; background-position-x: ; background-position-y: ; background-size: =
; background-repeat-x: ; background-repeat-y: ; background-attachment: ; =
background-origin: ; background-clip: ; background-color: var(--md-box-in=
line-code-background); border-radius: var(--md-box-inline-code-border-rad=
ius); color: var(--md-box-samantha-normal-text-color) !important; overflo=
w-anchor: auto; font-weight: 400; line-height: var(--md-box-samantha-norm=
al-text-line-height);">radeon_audio_component_get_eld</code><span>=C2=A0<=
/span>is
      a callback function used by the audio component (<code
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border-width: =
var(--md-box-inline-code-border-width); border-style: var(--md-box-inline=
-code-border-style); border-color: var(--md-box-inline-code-border-color)=
; border-image: initial; margin-top: var(--md-box-inline-code-margin-top)=
; margin-right: var(--md-box-inline-code-margin-right); margin-bottom: va=
r(--md-box-inline-code-margin-bottom); margin-left: var(--md-box-inline-c=
ode-margin-left); padding-top: var(--md-box-inline-code-padding-top); pad=
ding-right: var(--md-box-inline-code-padding-right); padding-bottom: var(=
--md-box-inline-code-padding-bottom); padding-left: var(--md-box-inline-c=
ode-padding-left); font-family: var(--md-box-global-font-family-mono); fo=
nt-feature-settings: var(--default-mono-font-feature-settings,normal); fo=
nt-size: var(--md-box-samantha-normal-text-font-size); font-variation-set=
tings: var(--default-mono-font-variation-settings,normal); background-ima=
ge: ; background-position-x: ; background-position-y: ; background-size: =
; background-repeat-x: ; background-repeat-y: ; background-attachment: ; =
background-origin: ; background-clip: ; background-color: var(--md-box-in=
line-code-background); border-radius: var(--md-box-inline-code-border-rad=
ius); color: var(--md-box-samantha-normal-text-color) !important; overflo=
w-anchor: auto; font-weight: 400; line-height: var(--md-box-samantha-norm=
al-text-line-height);">snd_hda_intel</code>).=C2=A0</div>
    <div
class=3D"auto-hide-last-sibling-br paragraph-JOTKXA paragraph-element br-=
paragraph-space"
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border: 0px so=
lid; margin-top: var(--md-box-body-margin-top); margin-right: var(--md-bo=
x-body-margin-right); margin-bottom: var(--md-box-body-margin-bottom); ma=
rgin-left: var(--md-box-body-margin-left); padding-top: var(--md-box-body=
-padding-top); padding-right: var(--md-box-body-padding-right); padding-b=
ottom: var(--md-box-body-padding-bottom); padding-left: var(--md-box-body=
-padding-left); line-height: var(--md-box-body-line-height); overflow-anc=
hor: auto; font-size: 16px; font-weight: 400; color: var(--md-box-body-co=
lor,var(--md-box-global-text-color)); font-family: Inter, -apple-system, =
BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;PingFang SC&quot;, &quot;=
Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue=
&quot;, Helvetica, Arial, sans-serif; font-style: normal; font-variant-li=
gatures: normal; font-variant-caps: normal; letter-spacing: normal; orpha=
ns: 2; text-align: start; text-indent: 0px; text-transform: none; white-s=
pace: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; background-color: rgb(255, 255, 255); text-decoration-thickness: initi=
al; text-decoration-style: initial; text-decoration-color: initial;">Its
      triggering works as follows:<span>=C2=A0</span><code
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border-width: =
var(--md-box-inline-code-border-width); border-style: var(--md-box-inline=
-code-border-style); border-color: var(--md-box-inline-code-border-color)=
; border-image: initial; margin-top: var(--md-box-inline-code-margin-top)=
; margin-right: var(--md-box-inline-code-margin-right); margin-bottom: va=
r(--md-box-inline-code-margin-bottom); margin-left: var(--md-box-inline-c=
ode-margin-left); padding-top: var(--md-box-inline-code-padding-top); pad=
ding-right: var(--md-box-inline-code-padding-right); padding-bottom: var(=
--md-box-inline-code-padding-bottom); padding-left: var(--md-box-inline-c=
ode-padding-left); font-family: var(--md-box-global-font-family-mono); fo=
nt-feature-settings: var(--default-mono-font-feature-settings,normal); fo=
nt-size: var(--md-box-samantha-normal-text-font-size); font-variation-set=
tings: var(--default-mono-font-variation-settings,normal); background-ima=
ge: ; background-position-x: ; background-position-y: ; background-size: =
; background-repeat-x: ; background-repeat-y: ; background-attachment: ; =
background-origin: ; background-clip: ; background-color: var(--md-box-in=
line-code-background); border-radius: var(--md-box-inline-code-border-rad=
ius); color: var(--md-box-samantha-normal-text-color) !important; overflo=
w-anchor: auto; font-weight: 400; line-height: var(--md-box-samantha-norm=
al-text-line-height);">radeon_audio_component_notify</code><span>=C2=A0</=
span>notifies
      the audio component to retrieve the latest state,=C2=A0</div>
    <div
class=3D"auto-hide-last-sibling-br paragraph-JOTKXA paragraph-element br-=
paragraph-space"
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border: 0px so=
lid; margin-top: var(--md-box-body-margin-top); margin-right: var(--md-bo=
x-body-margin-right); margin-bottom: var(--md-box-body-margin-bottom); ma=
rgin-left: var(--md-box-body-margin-left); padding-top: var(--md-box-body=
-padding-top); padding-right: var(--md-box-body-padding-right); padding-b=
ottom: var(--md-box-body-padding-bottom); padding-left: var(--md-box-body=
-padding-left); line-height: var(--md-box-body-line-height); overflow-anc=
hor: auto; font-size: 16px; font-weight: 400; color: var(--md-box-body-co=
lor,var(--md-box-global-text-color)); font-family: Inter, -apple-system, =
BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;PingFang SC&quot;, &quot;=
Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue=
&quot;, Helvetica, Arial, sans-serif; font-style: normal; font-variant-li=
gatures: normal; font-variant-caps: normal; letter-spacing: normal; orpha=
ns: 2; text-align: start; text-indent: 0px; text-transform: none; white-s=
pace: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; background-color: rgb(255, 255, 255); text-decoration-thickness: initi=
al; text-decoration-style: initial; text-decoration-color: initial;">but
      when<span>=C2=A0</span><code
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border-width: =
var(--md-box-inline-code-border-width); border-style: var(--md-box-inline=
-code-border-style); border-color: var(--md-box-inline-code-border-color)=
; border-image: initial; margin-top: var(--md-box-inline-code-margin-top)=
; margin-right: var(--md-box-inline-code-margin-right); margin-bottom: va=
r(--md-box-inline-code-margin-bottom); margin-left: var(--md-box-inline-c=
ode-margin-left); padding-top: var(--md-box-inline-code-padding-top); pad=
ding-right: var(--md-box-inline-code-padding-right); padding-bottom: var(=
--md-box-inline-code-padding-bottom); padding-left: var(--md-box-inline-c=
ode-padding-left); font-family: var(--md-box-global-font-family-mono); fo=
nt-feature-settings: var(--default-mono-font-feature-settings,normal); fo=
nt-size: var(--md-box-samantha-normal-text-font-size); font-variation-set=
tings: var(--default-mono-font-variation-settings,normal); background-ima=
ge: ; background-position-x: ; background-position-y: ; background-size: =
; background-repeat-x: ; background-repeat-y: ; background-attachment: ; =
background-origin: ; background-clip: ; background-color: var(--md-box-in=
line-code-background); border-radius: var(--md-box-inline-code-border-rad=
ius); color: var(--md-box-samantha-normal-text-color) !important; overflo=
w-anchor: auto; font-weight: 400; line-height: var(--md-box-samantha-norm=
al-text-line-height);">radeon_audio_component_get_eld</code><span>=C2=A0<=
/span>actually
      executes,<span>=C2=A0</span><code
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border-width: =
var(--md-box-inline-code-border-width); border-style: var(--md-box-inline=
-code-border-style); border-color: var(--md-box-inline-code-border-color)=
; border-image: initial; margin-top: var(--md-box-inline-code-margin-top)=
; margin-right: var(--md-box-inline-code-margin-right); margin-bottom: va=
r(--md-box-inline-code-margin-bottom); margin-left: var(--md-box-inline-c=
ode-margin-left); padding-top: var(--md-box-inline-code-padding-top); pad=
ding-right: var(--md-box-inline-code-padding-right); padding-bottom: var(=
--md-box-inline-code-padding-bottom); padding-left: var(--md-box-inline-c=
ode-padding-left); font-family: var(--md-box-global-font-family-mono); fo=
nt-feature-settings: var(--default-mono-font-feature-settings,normal); fo=
nt-size: var(--md-box-samantha-normal-text-font-size); font-variation-set=
tings: var(--default-mono-font-variation-settings,normal); background-ima=
ge: ; background-position-x: ; background-position-y: ; background-size: =
; background-repeat-x: ; background-repeat-y: ; background-attachment: ; =
background-origin: ; background-clip: ; background-color: var(--md-box-in=
line-code-background); border-radius: var(--md-box-inline-code-border-rad=
ius); color: var(--md-box-samantha-normal-text-color) !important; overflo=
w-anchor: auto; font-weight: 400; line-height: var(--md-box-samantha-norm=
al-text-line-height);">radeon_dvi_detect</code>/<code
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border-width: =
var(--md-box-inline-code-border-width); border-style: var(--md-box-inline=
-code-border-style); border-color: var(--md-box-inline-code-border-color)=
; border-image: initial; margin-top: var(--md-box-inline-code-margin-top)=
; margin-right: var(--md-box-inline-code-margin-right); margin-bottom: va=
r(--md-box-inline-code-margin-bottom); margin-left: var(--md-box-inline-c=
ode-margin-left); padding-top: var(--md-box-inline-code-padding-top); pad=
ding-right: var(--md-box-inline-code-padding-right); padding-bottom: var(=
--md-box-inline-code-padding-bottom); padding-left: var(--md-box-inline-c=
ode-padding-left); font-family: var(--md-box-global-font-family-mono); fo=
nt-feature-settings: var(--default-mono-font-feature-settings,normal); fo=
nt-size: var(--md-box-samantha-normal-text-font-size); font-variation-set=
tings: var(--default-mono-font-variation-settings,normal); background-ima=
ge: ; background-position-x: ; background-position-y: ; background-size: =
; background-repeat-x: ; background-repeat-y: ; background-attachment: ; =
background-origin: ; background-clip: ; background-color: var(--md-box-in=
line-code-background); border-radius: var(--md-box-inline-code-border-rad=
ius); color: var(--md-box-samantha-normal-text-color) !important; overflo=
w-anchor: auto; font-weight: 400; line-height: var(--md-box-samantha-norm=
al-text-line-height);">radeon_dp_detect</code><span>=C2=A0</span>has
      not yet completed, resulting in incorrect retrieval of the
      connector's state.</div>
    <div
class=3D"container-utlnW2 md-box-line-break wrapper-d0Cc1k undefined"
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border: 0px so=
lid; margin-top: var(--md-box-paragraph-spacing); margin-right: 0px; marg=
in-bottom: 0px; margin-left: 0px; padding: 0px; display: block; user-sele=
ct: none; visibility: hidden; overflow-anchor: auto; color: rgb(0, 0, 0);=
 font-family: Inter, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&qu=
ot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microso=
ft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;=
 font-size: 16px; font-style: normal; font-variant-ligatures: normal; fon=
t-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans=
: 2; text-align: start; text-indent: 0px; text-transform: none; white-spa=
ce: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 background-color: rgb(255, 255, 255); text-decoration-thickness: initial=
; text-decoration-style: initial; text-decoration-color: initial;"></div>=

    <div
class=3D"auto-hide-last-sibling-br paragraph-JOTKXA paragraph-element br-=
paragraph-space"
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border: 0px so=
lid; margin-top: var(--md-box-body-margin-top); margin-right: var(--md-bo=
x-body-margin-right); margin-bottom: var(--md-box-body-margin-bottom); ma=
rgin-left: var(--md-box-body-margin-left); padding-top: var(--md-box-body=
-padding-top); padding-right: var(--md-box-body-padding-right); padding-b=
ottom: var(--md-box-body-padding-bottom); padding-left: var(--md-box-body=
-padding-left); line-height: var(--md-box-body-line-height); overflow-anc=
hor: auto; font-size: 16px; font-weight: 400; color: var(--md-box-body-co=
lor,var(--md-box-global-text-color)); font-family: Inter, -apple-system, =
BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;PingFang SC&quot;, &quot;=
Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue=
&quot;, Helvetica, Arial, sans-serif; font-style: normal; font-variant-li=
gatures: normal; font-variant-caps: normal; letter-spacing: normal; orpha=
ns: 2; text-align: start; text-indent: 0px; text-transform: none; white-s=
pace: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; background-color: rgb(255, 255, 255); text-decoration-thickness: initi=
al; text-decoration-style: initial; text-decoration-color: initial;">You
      mentioned this looks like a race condition, and that is indeed the
      case, but their starting points are different.=C2=A0</div>
    <div
class=3D"auto-hide-last-sibling-br paragraph-JOTKXA paragraph-element br-=
paragraph-space"
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border: 0px so=
lid; margin-top: var(--md-box-body-margin-top); margin-right: var(--md-bo=
x-body-margin-right); margin-bottom: var(--md-box-body-margin-bottom); ma=
rgin-left: var(--md-box-body-margin-left); padding-top: var(--md-box-body=
-padding-top); padding-right: var(--md-box-body-padding-right); padding-b=
ottom: var(--md-box-body-padding-bottom); padding-left: var(--md-box-body=
-padding-left); line-height: var(--md-box-body-line-height); overflow-anc=
hor: auto; font-size: 16px; font-weight: 400; color: var(--md-box-body-co=
lor,var(--md-box-global-text-color)); font-family: Inter, -apple-system, =
BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;PingFang SC&quot;, &quot;=
Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue=
&quot;, Helvetica, Arial, sans-serif; font-style: normal; font-variant-li=
gatures: normal; font-variant-caps: normal; letter-spacing: normal; orpha=
ns: 2; text-align: start; text-indent: 0px; text-transform: none; white-s=
pace: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; background-color: rgb(255, 255, 255); text-decoration-thickness: initi=
al; text-decoration-style: initial; text-decoration-color: initial;">Furt=
hermore,<span>=C2=A0</span><code
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border-width: =
var(--md-box-inline-code-border-width); border-style: var(--md-box-inline=
-code-border-style); border-color: var(--md-box-inline-code-border-color)=
; border-image: initial; margin-top: var(--md-box-inline-code-margin-top)=
; margin-right: var(--md-box-inline-code-margin-right); margin-bottom: va=
r(--md-box-inline-code-margin-bottom); margin-left: var(--md-box-inline-c=
ode-margin-left); padding-top: var(--md-box-inline-code-padding-top); pad=
ding-right: var(--md-box-inline-code-padding-right); padding-bottom: var(=
--md-box-inline-code-padding-bottom); padding-left: var(--md-box-inline-c=
ode-padding-left); font-family: var(--md-box-global-font-family-mono); fo=
nt-feature-settings: var(--default-mono-font-feature-settings,normal); fo=
nt-size: var(--md-box-samantha-normal-text-font-size); font-variation-set=
tings: var(--default-mono-font-variation-settings,normal); background-ima=
ge: ; background-position-x: ; background-position-y: ; background-size: =
; background-repeat-x: ; background-repeat-y: ; background-attachment: ; =
background-origin: ; background-clip: ; background-color: var(--md-box-in=
line-code-background); border-radius: var(--md-box-inline-code-border-rad=
ius); color: var(--md-box-samantha-normal-text-color) !important; overflo=
w-anchor: auto; font-weight: 400; line-height: var(--md-box-samantha-norm=
al-text-line-height);">radeon_audio_component_notify</code><span>=C2=A0</=
span>already
      has<span>=C2=A0</span><code
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border-width: =
var(--md-box-inline-code-border-width); border-style: var(--md-box-inline=
-code-border-style); border-color: var(--md-box-inline-code-border-color)=
; border-image: initial; margin-top: var(--md-box-inline-code-margin-top)=
; margin-right: var(--md-box-inline-code-margin-right); margin-bottom: va=
r(--md-box-inline-code-margin-bottom); margin-left: var(--md-box-inline-c=
ode-margin-left); padding-top: var(--md-box-inline-code-padding-top); pad=
ding-right: var(--md-box-inline-code-padding-right); padding-bottom: var(=
--md-box-inline-code-padding-bottom); padding-left: var(--md-box-inline-c=
ode-padding-left); font-family: var(--md-box-global-font-family-mono); fo=
nt-feature-settings: var(--default-mono-font-feature-settings,normal); fo=
nt-size: var(--md-box-samantha-normal-text-font-size); font-variation-set=
tings: var(--default-mono-font-variation-settings,normal); background-ima=
ge: ; background-position-x: ; background-position-y: ; background-size: =
; background-repeat-x: ; background-repeat-y: ; background-attachment: ; =
background-origin: ; background-clip: ; background-color: var(--md-box-in=
line-code-background); border-radius: var(--md-box-inline-code-border-rad=
ius); color: var(--md-box-samantha-normal-text-color) !important; overflo=
w-anchor: auto; font-weight: 400; line-height: var(--md-box-samantha-norm=
al-text-line-height);">mutex_lock(&amp;connector-&gt;eld_mutex)</code><sp=
an>=C2=A0</span>and<span>=C2=A0</span><code
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border-width: =
var(--md-box-inline-code-border-width); border-style: var(--md-box-inline=
-code-border-style); border-color: var(--md-box-inline-code-border-color)=
; border-image: initial; margin-top: var(--md-box-inline-code-margin-top)=
; margin-right: var(--md-box-inline-code-margin-right); margin-bottom: va=
r(--md-box-inline-code-margin-bottom); margin-left: var(--md-box-inline-c=
ode-margin-left); padding-top: var(--md-box-inline-code-padding-top); pad=
ding-right: var(--md-box-inline-code-padding-right); padding-bottom: var(=
--md-box-inline-code-padding-bottom); padding-left: var(--md-box-inline-c=
ode-padding-left); font-family: var(--md-box-global-font-family-mono); fo=
nt-feature-settings: var(--default-mono-font-feature-settings,normal); fo=
nt-size: var(--md-box-samantha-normal-text-font-size); font-variation-set=
tings: var(--default-mono-font-variation-settings,normal); background-ima=
ge: ; background-position-x: ; background-position-y: ; background-size: =
; background-repeat-x: ; background-repeat-y: ; background-attachment: ; =
background-origin: ; background-clip: ; background-color: var(--md-box-in=
line-code-background); border-radius: var(--md-box-inline-code-border-rad=
ius); color: var(--md-box-samantha-normal-text-color) !important; overflo=
w-anchor: auto; font-weight: 400; line-height: var(--md-box-samantha-norm=
al-text-line-height);">mutex_unlock(&amp;connector-&gt;eld_mutex)</code>,=
=C2=A0</div>
    <div
class=3D"auto-hide-last-sibling-br paragraph-JOTKXA paragraph-element br-=
paragraph-space"
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border: 0px so=
lid; margin-top: var(--md-box-body-margin-top); margin-right: var(--md-bo=
x-body-margin-right); margin-bottom: var(--md-box-body-margin-bottom); ma=
rgin-left: var(--md-box-body-margin-left); padding-top: var(--md-box-body=
-padding-top); padding-right: var(--md-box-body-padding-right); padding-b=
ottom: var(--md-box-body-padding-bottom); padding-left: var(--md-box-body=
-padding-left); line-height: var(--md-box-body-line-height); overflow-anc=
hor: auto; font-size: 16px; font-weight: 400; color: var(--md-box-body-co=
lor,var(--md-box-global-text-color)); font-family: Inter, -apple-system, =
BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;PingFang SC&quot;, &quot;=
Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue=
&quot;, Helvetica, Arial, sans-serif; font-style: normal; font-variant-li=
gatures: normal; font-variant-caps: normal; letter-spacing: normal; orpha=
ns: 2; text-align: start; text-indent: 0px; text-transform: none; white-s=
pace: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; background-color: rgb(255, 255, 255); text-decoration-thickness: initi=
al; text-decoration-style: initial; text-decoration-color: initial;">
      <div
style=3D"color: #cccccc;background-color: #1f1f1f;font-family: 'Droid San=
s Mono', 'monospace', monospace;font-weight: normal;font-size: 14px;line-=
height: 19px;white-space: pre;"><div><span
      style=3D"color: #569cd6;">static</span><span style=3D"color: #ccccc=
c;"> </span><span
      style=3D"color: #569cd6;">void</span><span style=3D"color: #cccccc;=
"> </span><span
      style=3D"color: #dcdcaa;">radeon_audio_component_notify</span><span=

      style=3D"color: #cccccc;">(</span><span style=3D"color: #569cd6;">s=
truct</span><span
      style=3D"color: #cccccc;"> </span><span style=3D"color: #4ec9b0;">r=
adeon_device</span><span
      style=3D"color: #cccccc;"> </span><span style=3D"color: #d4d4d4;">*=
</span><span
      style=3D"color: #9cdcfe;">rdev</span><span style=3D"color: #cccccc;=
">, </span><span
      style=3D"color: #569cd6;">int</span><span style=3D"color: #cccccc;"=
> </span><span
      style=3D"color: #9cdcfe;">port</span><span style=3D"color: #cccccc;=
">)</span></div><div><span
      style=3D"color: #cccccc;">{</span></div><div><span
      style=3D"color: #cccccc;">    </span><span style=3D"color: #569cd6;=
">struct</span><span
      style=3D"color: #cccccc;"> </span><span style=3D"color: #4ec9b0;">d=
rm_audio_component</span><span
      style=3D"color: #cccccc;"> </span><span style=3D"color: #d4d4d4;">*=
</span><span
      style=3D"color: #9cdcfe;">acomp</span><span style=3D"color: #cccccc=
;">;</span></div>
<div><span style=3D"color: #cccccc;">    </span><span
      style=3D"color: #dcdcaa;">mutex_lock</span><span
      style=3D"color: #cccccc;">(</span><span style=3D"color: #d4d4d4;">&=
amp;</span><span
      style=3D"color: #9cdcfe;">rdev</span><span style=3D"color: #cccccc;=
">-&gt;</span><span
      style=3D"color: #9cdcfe;">audio</span><span style=3D"color: #cccccc=
;">.</span><span
      style=3D"color: #9cdcfe;">component_mutex</span><span
      style=3D"color: #cccccc;">);</span></div><div><span
      style=3D"color: #cccccc;">    </span><span style=3D"color: #9cdcfe;=
">acomp</span><span
      style=3D"color: #cccccc;"> </span><span style=3D"color: #d4d4d4;">=3D=
</span><span
      style=3D"color: #cccccc;"> </span><span style=3D"color: #9cdcfe;">r=
dev</span><span
      style=3D"color: #cccccc;">-&gt;</span><span style=3D"color: #9cdcfe=
;">audio</span><span
      style=3D"color: #cccccc;">.</span><span style=3D"color: #9cdcfe;">c=
omponent</span><span
      style=3D"color: #cccccc;">;</span></div><div><span
      style=3D"color: #cccccc;">    </span><span style=3D"color: #c586c0;=
">if</span><span
      style=3D"color: #cccccc;"> (</span><span style=3D"color: #9cdcfe;">=
acomp</span><span
      style=3D"color: #cccccc;"> </span><span style=3D"color: #d4d4d4;">&=
amp;&amp;</span><span
      style=3D"color: #cccccc;"> </span><span style=3D"color: #9cdcfe;">a=
comp</span><span
      style=3D"color: #cccccc;">-&gt;</span><span style=3D"color: #9cdcfe=
;">audio_ops</span><span
      style=3D"color: #cccccc;"> </span><span style=3D"color: #d4d4d4;">&=
amp;&amp;</span><span
      style=3D"color: #cccccc;"> </span><span style=3D"color: #9cdcfe;">a=
comp</span><span
      style=3D"color: #cccccc;">-&gt;</span><span style=3D"color: #9cdcfe=
;">audio_ops</span><span
      style=3D"color: #cccccc;">-&gt;</span><span style=3D"color: #9cdcfe=
;">pin_eld_notify</span><span
      style=3D"color: #cccccc;">)</span></div><div><span
      style=3D"color: #cccccc;">        </span><span
      style=3D"color: #9cdcfe;">acomp</span><span style=3D"color: #cccccc=
;">-&gt;</span><span
      style=3D"color: #9cdcfe;">audio_ops</span><span
      style=3D"color: #cccccc;">-&gt;</span><span style=3D"color: #dcdcaa=
;">pin_eld_notify</span><span
      style=3D"color: #cccccc;">(</span><span style=3D"color: #9cdcfe;">a=
comp</span><span
      style=3D"color: #cccccc;">-&gt;</span><span style=3D"color: #9cdcfe=
;">audio_ops</span><span
      style=3D"color: #cccccc;">-&gt;</span><span style=3D"color: #9cdcfe=
;">audio_ptr</span><span
      style=3D"color: #cccccc;">,</span></div><div><span
      style=3D"color: #cccccc;">                         </span><span
      style=3D"color: #9cdcfe;">port</span><span style=3D"color: #cccccc;=
">, </span><span
      style=3D"color: #d4d4d4;">-</span><span style=3D"color: #b5cea8;">1=
</span><span
      style=3D"color: #cccccc;">);</span></div><div><span
      style=3D"color: #cccccc;">    </span><span style=3D"color: #dcdcaa;=
">mutex_unlock</span><span
      style=3D"color: #cccccc;">(</span><span style=3D"color: #d4d4d4;">&=
amp;</span><span
      style=3D"color: #9cdcfe;">rdev</span><span style=3D"color: #cccccc;=
">-&gt;</span><span
      style=3D"color: #9cdcfe;">audio</span><span style=3D"color: #cccccc=
;">.</span><span
      style=3D"color: #9cdcfe;">component_mutex</span><span
      style=3D"color: #cccccc;">);</span></div><div><span
      style=3D"color: #cccccc;">}</span></div></div>
      <br>
    </div>
    <div
class=3D"auto-hide-last-sibling-br paragraph-JOTKXA paragraph-element br-=
paragraph-space"
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border: 0px so=
lid; margin-top: var(--md-box-body-margin-top); margin-right: var(--md-bo=
x-body-margin-right); margin-bottom: var(--md-box-body-margin-bottom); ma=
rgin-left: var(--md-box-body-margin-left); padding-top: var(--md-box-body=
-padding-top); padding-right: var(--md-box-body-padding-right); padding-b=
ottom: var(--md-box-body-padding-bottom); padding-left: var(--md-box-body=
-padding-left); line-height: var(--md-box-body-line-height); overflow-anc=
hor: auto; font-size: 16px; font-weight: 400; color: var(--md-box-body-co=
lor,var(--md-box-global-text-color)); font-family: Inter, -apple-system, =
BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;PingFang SC&quot;, &quot;=
Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue=
&quot;, Helvetica, Arial, sans-serif; font-style: normal; font-variant-li=
gatures: normal; font-variant-caps: normal; letter-spacing: normal; orpha=
ns: 2; text-align: start; text-indent: 0px; text-transform: none; white-s=
pace: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; background-color: rgb(255, 255, 255); text-decoration-thickness: initi=
al; text-decoration-style: initial; text-decoration-color: initial;">but
      this doesn't work because<span>=C2=A0</span><code
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border-width: =
var(--md-box-inline-code-border-width); border-style: var(--md-box-inline=
-code-border-style); border-color: var(--md-box-inline-code-border-color)=
; border-image: initial; margin-top: var(--md-box-inline-code-margin-top)=
; margin-right: var(--md-box-inline-code-margin-right); margin-bottom: va=
r(--md-box-inline-code-margin-bottom); margin-left: var(--md-box-inline-c=
ode-margin-left); padding-top: var(--md-box-inline-code-padding-top); pad=
ding-right: var(--md-box-inline-code-padding-right); padding-bottom: var(=
--md-box-inline-code-padding-bottom); padding-left: var(--md-box-inline-c=
ode-padding-left); font-family: var(--md-box-global-font-family-mono); fo=
nt-feature-settings: var(--default-mono-font-feature-settings,normal); fo=
nt-size: var(--md-box-samantha-normal-text-font-size); font-variation-set=
tings: var(--default-mono-font-variation-settings,normal); background-ima=
ge: ; background-position-x: ; background-position-y: ; background-size: =
; background-repeat-x: ; background-repeat-y: ; background-attachment: ; =
background-origin: ; background-clip: ; background-color: var(--md-box-in=
line-code-background); border-radius: var(--md-box-inline-code-border-rad=
ius); color: var(--md-box-samantha-normal-text-color) !important; overflo=
w-anchor: auto; font-weight: 400; line-height: var(--md-box-samantha-norm=
al-text-line-height);">radeon_audio_component_notify</code><span>=C2=A0</=
span>and<span>=C2=A0</span><code
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border-width: =
var(--md-box-inline-code-border-width); border-style: var(--md-box-inline=
-code-border-style); border-color: var(--md-box-inline-code-border-color)=
; border-image: initial; margin-top: var(--md-box-inline-code-margin-top)=
; margin-right: var(--md-box-inline-code-margin-right); margin-bottom: va=
r(--md-box-inline-code-margin-bottom); margin-left: var(--md-box-inline-c=
ode-margin-left); padding-top: var(--md-box-inline-code-padding-top); pad=
ding-right: var(--md-box-inline-code-padding-right); padding-bottom: var(=
--md-box-inline-code-padding-bottom); padding-left: var(--md-box-inline-c=
ode-padding-left); font-family: var(--md-box-global-font-family-mono); fo=
nt-feature-settings: var(--default-mono-font-feature-settings,normal); fo=
nt-size: var(--md-box-samantha-normal-text-font-size); font-variation-set=
tings: var(--default-mono-font-variation-settings,normal); background-ima=
ge: ; background-position-x: ; background-position-y: ; background-size: =
; background-repeat-x: ; background-repeat-y: ; background-attachment: ; =
background-origin: ; background-clip: ; background-color: var(--md-box-in=
line-code-background); border-radius: var(--md-box-inline-code-border-rad=
ius); color: var(--md-box-samantha-normal-text-color) !important; overflo=
w-anchor: auto; font-weight: 400; line-height: var(--md-box-samantha-norm=
al-text-line-height);">radeon_audio_component_get_eld</code><span>=C2=A0<=
/span>do
      not have a hierarchical relationship;</div>
    <div
class=3D"auto-hide-last-sibling-br paragraph-JOTKXA paragraph-element br-=
paragraph-space"
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border: 0px so=
lid; margin-top: var(--md-box-body-margin-top); margin-right: var(--md-bo=
x-body-margin-right); margin-bottom: var(--md-box-body-margin-bottom); ma=
rgin-left: var(--md-box-body-margin-left); padding-top: var(--md-box-body=
-padding-top); padding-right: var(--md-box-body-padding-right); padding-b=
ottom: var(--md-box-body-padding-bottom); padding-left: var(--md-box-body=
-padding-left); line-height: var(--md-box-body-line-height); overflow-anc=
hor: auto; font-size: 16px; font-weight: 400; color: var(--md-box-body-co=
lor,var(--md-box-global-text-color)); font-family: Inter, -apple-system, =
BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;PingFang SC&quot;, &quot;=
Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue=
&quot;, Helvetica, Arial, sans-serif; font-style: normal; font-variant-li=
gatures: normal; font-variant-caps: normal; letter-spacing: normal; orpha=
ns: 2; text-align: start; text-indent: 0px; text-transform: none; white-s=
pace: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; background-color: rgb(255, 255, 255); text-decoration-thickness: initi=
al; text-decoration-style: initial; text-decoration-color: initial;">=C2=A0=
instead,
      it's an indirect notification-based relationship.<span>=C2=A0</span=
><code
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border-width: =
var(--md-box-inline-code-border-width); border-style: var(--md-box-inline=
-code-border-style); border-color: var(--md-box-inline-code-border-color)=
; border-image: initial; margin-top: var(--md-box-inline-code-margin-top)=
; margin-right: var(--md-box-inline-code-margin-right); margin-bottom: va=
r(--md-box-inline-code-margin-bottom); margin-left: var(--md-box-inline-c=
ode-margin-left); padding-top: var(--md-box-inline-code-padding-top); pad=
ding-right: var(--md-box-inline-code-padding-right); padding-bottom: var(=
--md-box-inline-code-padding-bottom); padding-left: var(--md-box-inline-c=
ode-padding-left); font-family: var(--md-box-global-font-family-mono); fo=
nt-feature-settings: var(--default-mono-font-feature-settings,normal); fo=
nt-size: var(--md-box-samantha-normal-text-font-size); font-variation-set=
tings: var(--default-mono-font-variation-settings,normal); background-ima=
ge: ; background-position-x: ; background-position-y: ; background-size: =
; background-repeat-x: ; background-repeat-y: ; background-attachment: ; =
background-origin: ; background-clip: ; background-color: var(--md-box-in=
line-code-background); border-radius: var(--md-box-inline-code-border-rad=
ius); color: var(--md-box-samantha-normal-text-color) !important; overflo=
w-anchor: auto; font-weight: 400; line-height: var(--md-box-samantha-norm=
al-text-line-height);">radeon_audio_component_notify</code><span>=C2=A0</=
span>notifies<span>=C2=A0</span><code
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border-width: =
var(--md-box-inline-code-border-width); border-style: var(--md-box-inline=
-code-border-style); border-color: var(--md-box-inline-code-border-color)=
; border-image: initial; margin-top: var(--md-box-inline-code-margin-top)=
; margin-right: var(--md-box-inline-code-margin-right); margin-bottom: va=
r(--md-box-inline-code-margin-bottom); margin-left: var(--md-box-inline-c=
ode-margin-left); padding-top: var(--md-box-inline-code-padding-top); pad=
ding-right: var(--md-box-inline-code-padding-right); padding-bottom: var(=
--md-box-inline-code-padding-bottom); padding-left: var(--md-box-inline-c=
ode-padding-left); font-family: var(--md-box-global-font-family-mono); fo=
nt-feature-settings: var(--default-mono-font-feature-settings,normal); fo=
nt-size: var(--md-box-samantha-normal-text-font-size); font-variation-set=
tings: var(--default-mono-font-variation-settings,normal); background-ima=
ge: ; background-position-x: ; background-position-y: ; background-size: =
; background-repeat-x: ; background-repeat-y: ; background-attachment: ; =
background-origin: ; background-clip: ; background-color: var(--md-box-in=
line-code-background); border-radius: var(--md-box-inline-code-border-rad=
ius); color: var(--md-box-samantha-normal-text-color) !important; overflo=
w-anchor: auto; font-weight: 400; line-height: var(--md-box-samantha-norm=
al-text-line-height);">snd_hda_intel</code>,
      and then<span>=C2=A0</span><code
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border-width: =
var(--md-box-inline-code-border-width); border-style: var(--md-box-inline=
-code-border-style); border-color: var(--md-box-inline-code-border-color)=
; border-image: initial; margin-top: var(--md-box-inline-code-margin-top)=
; margin-right: var(--md-box-inline-code-margin-right); margin-bottom: va=
r(--md-box-inline-code-margin-bottom); margin-left: var(--md-box-inline-c=
ode-margin-left); padding-top: var(--md-box-inline-code-padding-top); pad=
ding-right: var(--md-box-inline-code-padding-right); padding-bottom: var(=
--md-box-inline-code-padding-bottom); padding-left: var(--md-box-inline-c=
ode-padding-left); font-family: var(--md-box-global-font-family-mono); fo=
nt-feature-settings: var(--default-mono-font-feature-settings,normal); fo=
nt-size: var(--md-box-samantha-normal-text-font-size); font-variation-set=
tings: var(--default-mono-font-variation-settings,normal); background-ima=
ge: ; background-position-x: ; background-position-y: ; background-size: =
; background-repeat-x: ; background-repeat-y: ; background-attachment: ; =
background-origin: ; background-clip: ; background-color: var(--md-box-in=
line-code-background); border-radius: var(--md-box-inline-code-border-rad=
ius); color: var(--md-box-samantha-normal-text-color) !important; overflo=
w-anchor: auto; font-weight: 400; line-height: var(--md-box-samantha-norm=
al-text-line-height);">snd_hda_intel</code><span>=C2=A0</span>executes<sp=
an>=C2=A0</span><code
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border-width: =
var(--md-box-inline-code-border-width); border-style: var(--md-box-inline=
-code-border-style); border-color: var(--md-box-inline-code-border-color)=
; border-image: initial; margin-top: var(--md-box-inline-code-margin-top)=
; margin-right: var(--md-box-inline-code-margin-right); margin-bottom: va=
r(--md-box-inline-code-margin-bottom); margin-left: var(--md-box-inline-c=
ode-margin-left); padding-top: var(--md-box-inline-code-padding-top); pad=
ding-right: var(--md-box-inline-code-padding-right); padding-bottom: var(=
--md-box-inline-code-padding-bottom); padding-left: var(--md-box-inline-c=
ode-padding-left); font-family: var(--md-box-global-font-family-mono); fo=
nt-feature-settings: var(--default-mono-font-feature-settings,normal); fo=
nt-size: var(--md-box-samantha-normal-text-font-size); font-variation-set=
tings: var(--default-mono-font-variation-settings,normal); background-ima=
ge: ; background-position-x: ; background-position-y: ; background-size: =
; background-repeat-x: ; background-repeat-y: ; background-attachment: ; =
background-origin: ; background-clip: ; background-color: var(--md-box-in=
line-code-background); border-radius: var(--md-box-inline-code-border-rad=
ius); color: var(--md-box-samantha-normal-text-color) !important; overflo=
w-anchor: auto; font-weight: 400; line-height: var(--md-box-samantha-norm=
al-text-line-height);">radeon_audio_component_get_eld</code>.</div>
    <div
class=3D"container-utlnW2 md-box-line-break wrapper-d0Cc1k undefined"
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border: 0px so=
lid; margin-top: var(--md-box-paragraph-spacing); margin-right: 0px; marg=
in-bottom: 0px; margin-left: 0px; padding: 0px; display: block; user-sele=
ct: none; visibility: hidden; overflow-anchor: auto; color: rgb(0, 0, 0);=
 font-family: Inter, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&qu=
ot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microso=
ft YaHei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;=
 font-size: 16px; font-style: normal; font-variant-ligatures: normal; fon=
t-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans=
: 2; text-align: start; text-indent: 0px; text-transform: none; white-spa=
ce: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 background-color: rgb(255, 255, 255); text-decoration-thickness: initial=
; text-decoration-style: initial; text-decoration-color: initial;"></div>=

    <div
class=3D"auto-hide-last-sibling-br paragraph-JOTKXA paragraph-element br-=
paragraph-space"
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border: 0px so=
lid; margin-top: var(--md-box-body-margin-top); margin-right: var(--md-bo=
x-body-margin-right); margin-bottom: var(--md-box-body-margin-bottom); ma=
rgin-left: var(--md-box-body-margin-left); padding-top: var(--md-box-body=
-padding-top); padding-right: var(--md-box-body-padding-right); padding-b=
ottom: var(--md-box-body-padding-bottom); padding-left: var(--md-box-body=
-padding-left); line-height: var(--md-box-body-line-height); overflow-anc=
hor: auto; font-size: 16px; font-weight: 400; color: var(--md-box-body-co=
lor,var(--md-box-global-text-color)); font-family: Inter, -apple-system, =
BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;PingFang SC&quot;, &quot;=
Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue=
&quot;, Helvetica, Arial, sans-serif; font-style: normal; font-variant-li=
gatures: normal; font-variant-caps: normal; letter-spacing: normal; orpha=
ns: 2; text-align: start; text-indent: 0px; text-transform: none; white-s=
pace: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; background-color: rgb(255, 255, 255); text-decoration-thickness: initi=
al; text-decoration-style: initial; text-decoration-color: initial;">Unle=
ss
      we acquire the lock in<span>=C2=A0</span><code
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border-width: =
var(--md-box-inline-code-border-width); border-style: var(--md-box-inline=
-code-border-style); border-color: var(--md-box-inline-code-border-color)=
; border-image: initial; margin-top: var(--md-box-inline-code-margin-top)=
; margin-right: var(--md-box-inline-code-margin-right); margin-bottom: va=
r(--md-box-inline-code-margin-bottom); margin-left: var(--md-box-inline-c=
ode-margin-left); padding-top: var(--md-box-inline-code-padding-top); pad=
ding-right: var(--md-box-inline-code-padding-right); padding-bottom: var(=
--md-box-inline-code-padding-bottom); padding-left: var(--md-box-inline-c=
ode-padding-left); font-family: var(--md-box-global-font-family-mono); fo=
nt-feature-settings: var(--default-mono-font-feature-settings,normal); fo=
nt-size: var(--md-box-samantha-normal-text-font-size); font-variation-set=
tings: var(--default-mono-font-variation-settings,normal); background-ima=
ge: ; background-position-x: ; background-position-y: ; background-size: =
; background-repeat-x: ; background-repeat-y: ; background-attachment: ; =
background-origin: ; background-clip: ; background-color: var(--md-box-in=
line-code-background); border-radius: var(--md-box-inline-code-border-rad=
ius); color: var(--md-box-samantha-normal-text-color) !important; overflo=
w-anchor: auto; font-weight: 400; line-height: var(--md-box-samantha-norm=
al-text-line-height);">radeon_audio_component_notify</code><span>=C2=A0</=
span>and
      release it in<span>=C2=A0</span><code
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border-width: =
var(--md-box-inline-code-border-width); border-style: var(--md-box-inline=
-code-border-style); border-color: var(--md-box-inline-code-border-color)=
; border-image: initial; margin-top: var(--md-box-inline-code-margin-top)=
; margin-right: var(--md-box-inline-code-margin-right); margin-bottom: va=
r(--md-box-inline-code-margin-bottom); margin-left: var(--md-box-inline-c=
ode-margin-left); padding-top: var(--md-box-inline-code-padding-top); pad=
ding-right: var(--md-box-inline-code-padding-right); padding-bottom: var(=
--md-box-inline-code-padding-bottom); padding-left: var(--md-box-inline-c=
ode-padding-left); font-family: var(--md-box-global-font-family-mono); fo=
nt-feature-settings: var(--default-mono-font-feature-settings,normal); fo=
nt-size: var(--md-box-samantha-normal-text-font-size); font-variation-set=
tings: var(--default-mono-font-variation-settings,normal); background-ima=
ge: ; background-position-x: ; background-position-y: ; background-size: =
; background-repeat-x: ; background-repeat-y: ; background-attachment: ; =
background-origin: ; background-clip: ; background-color: var(--md-box-in=
line-code-background); border-radius: var(--md-box-inline-code-border-rad=
ius); color: var(--md-box-samantha-normal-text-color) !important; overflo=
w-anchor: auto; font-weight: 400; line-height: var(--md-box-samantha-norm=
al-text-line-height);">radeon_audio_component_get_eld</code>=E2=80=94but
      this could lead to a deadlock,</div>
    <div
class=3D"auto-hide-last-sibling-br paragraph-JOTKXA paragraph-element br-=
paragraph-space"
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border: 0px so=
lid; margin-top: var(--md-box-body-margin-top); margin-right: var(--md-bo=
x-body-margin-right); margin-bottom: var(--md-box-body-margin-bottom); ma=
rgin-left: var(--md-box-body-margin-left); padding-top: var(--md-box-body=
-padding-top); padding-right: var(--md-box-body-padding-right); padding-b=
ottom: var(--md-box-body-padding-bottom); padding-left: var(--md-box-body=
-padding-left); line-height: var(--md-box-body-line-height); overflow-anc=
hor: auto; font-size: 16px; font-weight: 400; color: var(--md-box-body-co=
lor,var(--md-box-global-text-color)); font-family: Inter, -apple-system, =
BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;PingFang SC&quot;, &quot;=
Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;Helvetica Neue=
&quot;, Helvetica, Arial, sans-serif; font-style: normal; font-variant-li=
gatures: normal; font-variant-caps: normal; letter-spacing: normal; orpha=
ns: 2; text-align: start; text-indent: 0px; text-transform: none; white-s=
pace: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; background-color: rgb(255, 255, 255); text-decoration-thickness: initi=
al; text-decoration-style: initial; text-decoration-color: initial;">=C2=A0=
because<span>=C2=A0</span><code
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border-width: =
var(--md-box-inline-code-border-width); border-style: var(--md-box-inline=
-code-border-style); border-color: var(--md-box-inline-code-border-color)=
; border-image: initial; margin-top: var(--md-box-inline-code-margin-top)=
; margin-right: var(--md-box-inline-code-margin-right); margin-bottom: va=
r(--md-box-inline-code-margin-bottom); margin-left: var(--md-box-inline-c=
ode-margin-left); padding-top: var(--md-box-inline-code-padding-top); pad=
ding-right: var(--md-box-inline-code-padding-right); padding-bottom: var(=
--md-box-inline-code-padding-bottom); padding-left: var(--md-box-inline-c=
ode-padding-left); font-family: var(--md-box-global-font-family-mono); fo=
nt-feature-settings: var(--default-mono-font-feature-settings,normal); fo=
nt-size: var(--md-box-samantha-normal-text-font-size); font-variation-set=
tings: var(--default-mono-font-variation-settings,normal); background-ima=
ge: ; background-position-x: ; background-position-y: ; background-size: =
; background-repeat-x: ; background-repeat-y: ; background-attachment: ; =
background-origin: ; background-clip: ; background-color: var(--md-box-in=
line-code-background); border-radius: var(--md-box-inline-code-border-rad=
ius); color: var(--md-box-samantha-normal-text-color) !important; overflo=
w-anchor: auto; font-weight: 400; line-height: var(--md-box-samantha-norm=
al-text-line-height);">radeon_audio_component_get_eld</code><span>=C2=A0<=
/span>is
      triggered through more means than just<span>=C2=A0</span><code
style=3D"-webkit-font-smoothing: antialiased; box-sizing: border-box; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0); outline: none; border-width: =
var(--md-box-inline-code-border-width); border-style: var(--md-box-inline=
-code-border-style); border-color: var(--md-box-inline-code-border-color)=
; border-image: initial; margin-top: var(--md-box-inline-code-margin-top)=
; margin-right: var(--md-box-inline-code-margin-right); margin-bottom: va=
r(--md-box-inline-code-margin-bottom); margin-left: var(--md-box-inline-c=
ode-margin-left); padding-top: var(--md-box-inline-code-padding-top); pad=
ding-right: var(--md-box-inline-code-padding-right); padding-bottom: var(=
--md-box-inline-code-padding-bottom); padding-left: var(--md-box-inline-c=
ode-padding-left); font-family: var(--md-box-global-font-family-mono); fo=
nt-feature-settings: var(--default-mono-font-feature-settings,normal); fo=
nt-size: var(--md-box-samantha-normal-text-font-size); font-variation-set=
tings: var(--default-mono-font-variation-settings,normal); background-ima=
ge: ; background-position-x: ; background-position-y: ; background-size: =
; background-repeat-x: ; background-repeat-y: ; background-attachment: ; =
background-origin: ; background-clip: ; background-color: var(--md-box-in=
line-code-background); border-radius: var(--md-box-inline-code-border-rad=
ius); color: var(--md-box-samantha-normal-text-color) !important; overflo=
w-anchor: auto; font-weight: 400; line-height: var(--md-box-samantha-norm=
al-text-line-height);">radeon_audio_component_notify</code>.</div>
    <p><br>
    </p>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">=E5=9C=A8 2025/9/25 01:58, Alex Deuche=
r =E5=86=99=E9=81=93:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CADnq5_PCGv7a4azG+mhv+=3DJmp74-O73iUnZctLkNYKabRGcwMg@mail.gm=
ail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">On Wed, Sep 24, 2025 at 7:44=
=E2=80=AFAM <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:2564278112@=
qq.com">&lt;2564278112@qq.com&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">
From: Wang Jiang <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:jiangw=
ang@kylinos.cn">&lt;jiangwang@kylinos.cn&gt;</a>

The audio detection process in the Radeon driver is as follows:
radeon_dvi_detect/radeon_dp_detect -&gt; radeon_audio_detect -&gt; radeon=
_audio_enable -&gt; radeon_audio_component_notify -&gt; radeon_audio_comp=
onent_get_eld
When HDMI is unplugged, radeon_dvi_detect is triggered.
At this point, radeon_audio_detect is triggered before radeon_dvi_detect =
has finished (which also means the new state of the connector has not bee=
n reported).
In this scenario, radeon_audio_detect can detect that the connector is di=
sconnected (because the parameter is passed down),
 but it is very likely that the audio callback function radeon_audio_comp=
onent_get_eld cannot detect the disconnection of the connector.
As a result, when the audio component (radeon_audio_component_get_eld) pe=
rforms detection, the connector's state is not shown as disconnected,
and connector-&gt;eld is not zero, causing the audio component to think t=
he audio driver is still working.
I have added a new member (enable_mask) to the audio structure to record =
the audio enable status.
Only when radeon_audio_component_get_eld detects that enable_mask is not =
zero will it continue to work.
There might be other solutions, such as placing radeon_audio_detect/radeo=
n_audio_component_notify after the completion of radeon_XX_detect.
However, I found that this would require significant changes (or perhaps =
it's just my limited coding skills?).
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
This still looks like a race.  I think the get_eld() callback can get
called whenever.  The proper fix is probably to hold the
connector-&gt;eld_mutex in radeon_audio_detect().

Alex

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">
Signed-off-by: Wang Jiang <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:jiangwang@kylinos.cn">&lt;jiangwang@kylinos.cn&gt;</a>
---
 drivers/gpu/drm/radeon/radeon.h       | 1 +
 drivers/gpu/drm/radeon/radeon_audio.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/rad=
eon.h
index 63c47585afbc..2d0a411e3ed6 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -1745,6 +1745,7 @@ struct r600_audio_pin {
        u32                     offset;
        bool                    connected;
        u32                     id;
+       u8                      enable_mask;
 };

 struct r600_audio {
diff --git a/drivers/gpu/drm/radeon/radeon_audio.c b/drivers/gpu/drm/rade=
on/radeon_audio.c
index 8d64ba18572e..a0717895cc8a 100644
--- a/drivers/gpu/drm/radeon/radeon_audio.c
+++ b/drivers/gpu/drm/radeon/radeon_audio.c
@@ -212,6 +212,7 @@ static void radeon_audio_enable(struct radeon_device =
*rdev,
        if (rdev-&gt;audio.funcs-&gt;enable)
                rdev-&gt;audio.funcs-&gt;enable(rdev, pin, enable_mask);

+       rdev-&gt;audio.pin[pin-&gt;id].enable_mask =3D enable_mask;
        radeon_audio_component_notify(rdev, pin-&gt;id);
 }

@@ -274,6 +275,7 @@ int radeon_audio_init(struct radeon_device *rdev)
                rdev-&gt;audio.pin[i].connected =3D false;
                rdev-&gt;audio.pin[i].offset =3D pin_offsets[i];
                rdev-&gt;audio.pin[i].id =3D i;
+               rdev-&gt;audio.pin[i].enable_mask =3D 0;
        }

        radeon_audio_interface_init(rdev);
@@ -760,6 +762,9 @@ static int radeon_audio_component_get_eld(struct devi=
ce *kdev, int port,
        if (!rdev-&gt;audio.enabled || !rdev-&gt;mode_info.mode_config_in=
itialized)
                return 0;

+       if (rdev-&gt;audio.pin[port].enable_mask =3D=3D 0)
+               return 0;
+
        list_for_each_entry(connector, &amp;dev-&gt;mode_config.connector=
_list, head) {
                const struct drm_connector_helper_funcs *connector_funcs =
=3D
                                connector-&gt;helper_private;
--
2.25.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------9b2EWMxnb3wtAFbiAuqBeoq0--

